---
name: ai-update
description: Report what AI tooling is actually being used in production DevOps/DevSecOps work for a given scope (IaC, CI/CD, cloud automation, version control, observability, reliability, security, cost), what real problem each tool solves, and which ones are worth an engineer's time versus which are hype. Always searches the web for current information rather than answering from memory. Use for "/ai-update <scope>", "what AI tools should I know", "AI in devops right now".
---

# AI Update

Report on **AI tooling that is actually in production use** for a given scope of
DevOps / DevSecOps work — what it does, what problem it solves, and whether this
engineer should spend time on it.

The engineer's goal is to be employable in an AI-assisted market without being
replaceable by the AI. That means knowing what these tools do, having used the
important ones, and understanding exactly where they fail. Write every report
with that lens.

---

## Rule zero — search, do not recall

**This scope changes monthly. Your training data is stale by definition.**

Always run web searches before writing the report. Never answer from memory
alone, and never present a remembered tool as current without confirming it.

Search for:

- `<scope> AI tools <current year>` — the landscape
- `<specific tool> production experience` — whether anyone actually runs it
- `<specific tool> vs <alternative>` — the honest comparison
- Recent HashiCorp / GitHub / AWS / CNCF announcements in the scope

If a search returns nothing credible for a tool you remember, say so plainly:
*"I recall X but could not confirm it is still maintained — verify before
investing time."* An out-of-date recommendation costs the engineer weeks.

---

## Step 1 — Resolve the scope

The argument is the scope. Recognise at least these, and accept anything else:

| Scope slug | Covers |
|---|---|
| `iac` / `infrastructure-as-code` | Terraform/OpenTofu/Pulumi generation, policy, drift, module authoring |
| `cicd` | Pipeline generation, flaky-test triage, build failure diagnosis, release notes |
| `cloud-automation` | Provisioning agents, cloud cost/rightsizing, account governance |
| `version-control` | PR review, commit quality, merge conflict resolution, codebase Q&A |
| `observability` | Log/trace summarisation, anomaly detection, natural-language querying |
| `reliability` / `sre` | Incident response copilots, postmortem drafting, runbook automation, alert noise reduction |
| `security` / `devsecops` | SAST/DAST triage, IaC misconfiguration, secret detection, dependency risk, SBOM |
| `kubernetes` | Cluster diagnosis, manifest generation, autoscaling, operators |
| `cost` / `finops` | Spend anomaly detection, commitment planning, waste identification |
| `all` | One compact pass across every scope above |

If no scope is given, ask which one — do not dump everything by default.

## Step 2 — Report shape

Lead with what changed, not with a definition of AI.

### A. What changed in this scope recently
Three to five bullets. Concrete: a GA release, a pricing change, a tool that
died, a practice that became standard. Date every claim.

### B. The tools that matter

For each tool, a block. **Never a bare list of names** — a name with no problem
attached is useless.

```markdown
### <Tool name> — <one-line what it is>

**Problem it solves:** <the specific pain that existed before it. Be concrete:
"reviewing 400-line Terraform PRs for hardcoded CIDRs by eye" beats
"improves productivity">
**How it works:** <mechanism, one or two sentences — enough to judge its limits>
**Where it fails:** <the honest part. Every tool has a failure mode; name it>
**Adoption:** <widely used / early / niche / dying — with evidence from search>
**Worth your time?** <Learn it / Know it exists / Skip> + one line of reasoning
```

### C. The verdict table

```markdown
| Tool | Problem solved | Adoption | Your call |
|------|---------------|----------|-----------|
| Terraform MCP server | LLM reads live state/registry instead of hallucinating resource args | Growing | Learn |
| <tool> | <problem> | <adoption> | Skip — <why> |
```

### D. Hype filter

Name what is **over-hyped in this scope right now** and why. This section is
mandatory and it should have teeth. An engineer with 7 hours a day and 6 months
cannot afford to chase a tool that will not exist next year. Being told what to
*ignore* is worth as much as being told what to learn.

### E. What this means for the engineer's actual job

Two parts, both required:

1. **What the AI now does** in this scope — the work that has genuinely stopped
   being a human differentiator.
2. **What it cannot do, and what therefore becomes more valuable** — usually:
   judgment under ambiguity, blast-radius reasoning, knowing when the generated
   answer is wrong, owning the outcome when it breaks.

Close with **one concrete action**: a tool to install and use on this repo this
week, tied to something they are already doing.

---

## Step 3 — Log it

Append to `AI-TOOLING/<scope>.md`, newest entry at the top so the file reads as
a changelog. Create `AI-TOOLING/README.md` as an index if absent.

```markdown
# AI Tooling — <Scope>

## 2026-09-03

**What changed:** <summary line>

| Tool | Problem solved | Adoption | Verdict |
|------|---------------|----------|---------|
| ... | ... | ... | ... |

**Hype filter:** <what to ignore, and why>
**Action taken:** <what they installed or tried>
**Revisit:** <date — usually 6-8 weeks>
```

Because entries are dated and stacked, this file becomes a record of how the
landscape moved — which is itself a strong interview signal. "I have tracked
this space for six months and here is what actually stuck" is a senior answer.

---

## Tone rules

1. **No breathlessness.** Not every release is a revolution. Most are not.
2. **Name the failure mode of every tool.** A tool with no stated weakness means
   you did not research it.
3. **Distinguish "used in production at real companies" from "launched".**
   Search for evidence of the former.
4. **Respect the 7-hour day.** Recommending five tools to learn is the same as
   recommending none. Rank ruthlessly; two is usually right.
5. **Never recommend a tool as a substitute for the underlying skill.** The
   engineer's stated goal is to own the fundamentals. A tool that hides a
   fundamental they have not learned yet gets flagged: *"use this after you can
   do it by hand, not before."*
