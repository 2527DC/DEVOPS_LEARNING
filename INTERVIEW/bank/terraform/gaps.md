# Terraform — rolling gaps

Ranked by what would actually sink a real interview. Drives question selection next round —
each open gap earns a fresh question at the same or higher difficulty.

Last updated: 2026-09-03 (Hard, 5Q, verdict No Hire)

---

## 1. `count` vs `for_each` and resource addressing — **OPEN, critical**
No model of how state keys resources. Did not know `aws_ecr_repository.app[2]` is the address, did not
know index shifting replaces every resource after a deleted middle element, could not explain why
`for_each` keys by string instead. This is the highest-frequency Terraform interview question that
exists and one of the most common real production outages.
*First seen: 2026-09-03 (Q2)*

## 2. Workspace ⇄ state selection — **OPEN, critical**
Believes `-var-file=dev.tfvars` targets the dev environment. It does not — the workspace alone selects
state (`env:/<workspace>/<key>` on the S3 backend). Answer given would destroy production.
Also missing: the counter-argument to workspaces for env isolation (shared backend, shared credentials,
shared blast radius; HashiCorp scopes them to short-lived parallel state).
Note: `Tereaform/Learning/WorkSpace.md` currently teaches only the pro-workspace side and reinforces
this error — fix that file.
*First seen: 2026-09-03 (Q4)*

## 3. CLI command fluency — **OPEN, high**
Consistent pattern across all five questions: knows roughly what should happen, cannot name the command.
Specifically absent: `terraform force-unlock`, `terraform import`, `terraform workspace select/show`,
`plan -refresh-only` / `apply -refresh-only`, `plan -generate-config-out`, `import {}` blocks.
At Hard difficulty this reads as book knowledge rather than hands-on experience.
Overlaps with `Tereaform/TODO.md`, which already lists taint / import / graph / state manipulation as unlearned.
*First seen: 2026-09-03 (Q1, Q3, Q4)*

## 4. Secrets in Terraform — **OPEN, high**
Total blank on Q5. No model of state as plaintext JSON, unaware `sensitive = true` is display-only,
unaware a saved plan file contains secrets in the clear. Does not know `manage_master_user_password`
or the Secrets Manager pattern. Already flagged in own notes (`Teraform_State.md` lists "sensitive data
exposure") but never converted into practice — matches the open TODO item "does the terraform project
have secrets, how are they handled".
*First seen: 2026-09-03 (Q5)*

## 5. Drift reconciliation mechanism — **OPEN, medium**
Knows the word "drift" and that state should match infra; could not name the command or articulate the
two directions (`-refresh-only` pulls cloud → state; plain apply pushes config → cloud). Got the
"write it into config" instinct right on the SG rule, which is partial credit.
*First seen: 2026-09-03 (Q3)*

---

## Answered well — keep off the easy list

- **State is persisted incrementally during apply** — correctly reasoned that after a SIGKILL between
  EC2 and RDS, state holds VPC + EC2 only. *2026-09-03 (Q1 FU2)*
- **Incident comms instinct** — halting the team and copying state before touching a broken lock.
  *2026-09-03 (Q1)*

---

## Not yet probed — candidates for next round

Remote backend config and partial `-backend-config`, `depends_on` vs implicit dependency graph,
`lifecycle` (`create_before_destroy`, `prevent_destroy`, `ignore_changes`), provider version pinning and
`.terraform.lock.hcl`, module versioning and registry sources, `terraform state mv` during refactors,
dynamic blocks, data sources vs hardcoded values, CI/CD apply gating and plan review, `-target` misuse,
provisioners as a last resort.
