# AI-TOOLING

Dated reports on AI tooling in DevOps/DevSecOps. Run `/ai-update <scope>`.

Entries are newest-first within each file, so each one reads as a changelog of
how the landscape actually moved — not a snapshot. That record is itself an
interview signal: *"I have tracked this space for six months, here is what
actually stuck and what died"* is a senior answer.

## Scopes

| File | Covers |
|---|---|
| `iac.md` | Terraform/OpenTofu generation, policy-as-code, drift detection |
| `cicd.md` | Pipeline generation, flaky test triage, build failure diagnosis |
| `cloud-automation.md` | Provisioning agents, governance, rightsizing |
| `version-control.md` | PR review, commit quality, codebase Q&A |
| `observability.md` | Log/trace summarisation, anomaly detection, NL querying |
| `reliability.md` | Incident copilots, postmortems, runbooks, alert noise |
| `security.md` | SAST/DAST triage, IaC misconfig, secrets, dependency risk |
| `kubernetes.md` | Cluster diagnosis, manifest generation |
| `cost.md` | Spend anomalies, commitment planning, waste |

## The rule these reports follow

Every tool is reported with the **problem it solves** and **where it fails**.
A list of tool names with no problem attached is worthless, and a tool with no
stated weakness means the research was not done.

Each report also carries a **hype filter** — what to deliberately ignore. With
7 hours a day and 6 months, being told what to skip is worth as much as being
told what to learn.

## The stance

Learn the tool *after* you can do the thing by hand, not before. A tool that
hides a fundamental you have not learned yet is a liability in an interview and
at 2am. The goal is to be the engineer who directs these tools and catches them
when they are wrong — which requires owning the fundamental underneath.
