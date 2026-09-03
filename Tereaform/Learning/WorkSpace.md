# Terraform Workspaces for Multi-Environment Management

> **Read the warning section before using this pattern for production.**
> Workspaces solve state isolation, but they do **not** give you environment safety.
> Got this wrong in a mock interview on 2026-09-03 — see `INTERVIEW/bank/terraform/`.

---

## What is the use of a workspace in Terraform?

Terraform **workspaces** let you run **one Terraform codebase** against **multiple separate state files**.

That is the whole feature. Everything else people claim about workspaces follows from that one fact — and so do their limits.

---

## The common problem in real projects

In a real-world Terraform project, infrastructure is usually written in a **modular way** so that:

- Every developer does **not** need to create a separate Terraform project
- The same modules can be reused across environments

A common approach is to create variable files like:

- `dev.tfvars`
- `test.tfvars`
- `prod.tfvars`

At first glance, it looks like we can simply change the variable file and run Terraform for different environments.

**This is the trap.** See the warning section below — changing the `.tfvars` file does not change the environment.

---

## The twist: Terraform state file

Terraform maintains a **state file** that tracks:

- What resources exist
- Their current configuration
- Any changes made during `terraform apply`

If you:

1. Apply infrastructure using `dev.tfvars`
2. Then switch to `test.tfvars` and run Terraform again

Terraform will **modify or overwrite the same resources**, because it is still using **one single state file**.

This creates a problem:

- You cannot preserve dev, test, and production infrastructures separately
- Switching environments will always change the existing infrastructure

---

## Why copying the Terraform project is not a good solution

One option is to maintain **separate copies of the same Terraform project** for each environment.

However, this leads to:

- Code duplication
- Difficult maintenance
- Higher risk of configuration drift

*(But note: the mature version of this idea — one thin root module per environment sharing common modules — is what most production teams actually use. It is not the same as copy-pasting the project. See "What production teams do instead".)*

---

## How Terraform workspaces solve this problem

Terraform workspaces allow you to:

- Use **one single Terraform project**
- Maintain **separate state files for each environment**
- Reuse the same modules and code

Each workspace has its **own isolated state file**, even though the Terraform configuration is the same.

### Where the state actually lives

This matters — you cannot reason about workspaces without knowing it. With an S3 backend configured as:

```hcl
terraform {
  backend "s3" {
    bucket = "my-tf-state"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}
```

state objects are laid out like this:

```text
s3://my-tf-state/infra/terraform.tfstate             <- the "default" workspace
s3://my-tf-state/env:/dev/infra/terraform.tfstate    <- workspace "dev"
s3://my-tf-state/env:/prod/infra/terraform.tfstate   <- workspace "prod"
```

Non-default workspaces are prefixed with `env:/<workspace-name>/`.
**One bucket. One set of credentials. One IAM boundary.** Remember that for the warning section.

---

## ⚠️ The two knobs are independent — this is the part that bites

There are two separate things in play, and they do **not** talk to each other:

| Knob | Set by | Controls |
|------|--------|----------|
| **Which state file** | `terraform workspace select <name>` | Which environment you are actually modifying |
| **Which values** | `-var-file=<file>.tfvars` | The numbers/strings fed into the config |

**`-var-file` has ZERO influence on state selection.** It passes variable *values*. Nothing more.
It does not know the file is called `dev.tfvars`. You could rename it `banana.tfvars` and Terraform would behave identically.

### The failure this causes

An engineer is asked to bump the instance count in dev. Their terminal is still on the `prod` workspace from an earlier session. They run:

```bash
terraform apply -var-file=dev.tfvars
```

They assume the `dev.tfvars` makes it safe. It does not. What actually happens:

1. Terraform reads **prod state** (`env:/prod/infra/terraform.tfstate`) — because the workspace says prod
2. It diffs that against **dev values** — because the var-file says dev
3. It applies the difference **to production**

Production now gets dev's instance types, dev's counts, dev's CIDRs, dev's AMIs. Resources are scaled down, replaced, or destroyed. There is no confirmation step that mentions the word "prod", and the damage is complete before the apply finishes.

### How to not do this

```bash
terraform workspace show                  # ALWAYS run this first
terraform workspace select dev            # THIS is what picks the environment
terraform apply -var-file=dev.tfvars      # this only supplies values
```

Better: put the workspace in your shell prompt so it is impossible to miss, and never run `apply` from a laptop against prod at all — see below.

---

## Using tfvars with workspaces

You can combine **workspaces** with **environment-specific tfvars files**:

- `dev.tfvars` → `dev` workspace
- `test.tfvars` → `test` workspace
- `prod.tfvars` → `prod` workspace

Example flow:

```bash
terraform workspace new dev
terraform apply -var-file=dev.tfvars

terraform workspace new test
terraform apply -var-file=test.tfvars

terraform workspace new prod
terraform apply -var-file=prod.tfvars
```

Each workspace:

- Uses the same Terraform code
- Uses its own variable values
- Maintains a **separate state file**

**But the pairing is a convention you are enforcing by hand.** Terraform does not check it. Nothing stops you from applying `prod.tfvars` in the `dev` workspace, or the reverse.

### `terraform.workspace` — reading the current workspace in config

The one place the workspace does leak into your configuration:

```hcl
locals {
  env = terraform.workspace
}

resource "aws_s3_bucket" "assets" {
  bucket = "myapp-assets-${terraform.workspace}"   # myapp-assets-dev, myapp-assets-prod
}
```

Useful for naming and tagging. **Do not use it to switch behaviour**, e.g.:

```hcl
# avoid this
instance_type = terraform.workspace == "prod" ? "m5.large" : "t3.micro"
```

That buries environment logic in the code where it is hard to review. Pass it in as a variable instead — that is what the `.tfvars` file is for.

---

## ⚠️ Why workspaces are NOT environment isolation

HashiCorp's own guidance is that workspaces are for **short-lived parallel state** — a feature branch, a temporary copy of infrastructure, a test run — **not** for separating dev from production.

The reasons:

1. **One backend, one credential set, one blast radius.** Every workspace lives in the same S3 bucket, reached with the same AWS credentials. Anyone who can apply to dev can apply to prod. Anyone who can read dev state can read prod state — including every secret in it.
2. **One command away from disaster.** The only thing standing between you and production is which workspace happens to be selected in your terminal. That is not a control.
3. **Identical configuration is a lie.** Prod eventually needs a different topology than dev — more AZs, read replicas, a WAF, different backup retention. Forcing one config to cover both means either conditionals scattered through the code or prod being under-provisioned.
4. **No independent versioning.** You cannot roll prod forward to a new module version while leaving dev alone, or vice versa. It is one codebase, one state of truth.
5. **Nothing is reviewable.** The workspace is ambient terminal state. It never appears in a PR, so a reviewer cannot see which environment a change targets.

### What production teams do instead

```text
terraform/
  modules/                 <- shared, versioned, reusable
    vpc/
    eks/
    rds/
  environments/
    dev/
      main.tf              <- thin: just module calls
      backend.tf           <- its OWN bucket / key / account
      terraform.tfvars
    stage/
      main.tf
      backend.tf
      terraform.tfvars
    prod/
      main.tf
      backend.tf           <- separate AWS account entirely
      terraform.tfvars
```

Why this wins:

- The environment is **the directory you are standing in** — visible, and visible in the PR diff
- Each environment has its **own backend, own bucket, own IAM, ideally its own AWS account**, so prod is not reachable by a mistyped command
- Prod can differ from dev where it genuinely needs to
- Module versions roll forward per environment
- **No code duplication** — the modules are shared; only the thin root module is repeated

### So when ARE workspaces the right tool?

- Spinning up a short-lived copy of infra per feature branch or per PR
- A quick throwaway environment for testing a module change
- Small, low-stakes setups where dev and prod genuinely are identical and the blast radius is acceptable
- Learning and practice (which is why this file exists)

---

## Rules to follow

1. Run `terraform workspace show` before **every** plan or apply. Put it in your prompt.
2. Remember: **workspace = which state. `-var-file` = which values.** They are unrelated.
3. Never run `apply` against production from a laptop. Applies belong in CI, where the pipeline sets the backend and workspace and a human only approves a reviewed plan.
4. For anything real, use **directory-per-environment with separate backends**, not workspaces.
5. Separate AWS accounts per environment is the only isolation that actually holds.

---

## Final summary

Terraform workspaces:

- Give you **separate state files from one codebase** — that is the real feature
- Are genuinely useful for **short-lived, parallel, throwaway environments**
- Do **not** provide security, credential, or blast-radius isolation
- Are **not** the recommended way to separate dev from production

The single most important thing on this page: **`-var-file` does not select the environment. The workspace does.** Getting that backwards means applying dev values to production state.

---

## Related

- `Teraform_State.md` — state locking, remote backends, why state is the single source of truth
- `Variables.md` — how `.tfvars` values flow into root and module variables
- `INTERVIEW/bank/terraform/sessions/2026-09-03.md` — the interview question this warning came from
