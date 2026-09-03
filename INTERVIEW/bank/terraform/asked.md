# Terraform — asked question registry

Every question here is **off limits** in future rounds — main questions and follow-ups both.
A genuinely new angle on the same concept is fine; the same question is not.

| Date | Difficulty | Question | Result |
|------|-----------|----------|--------|
| 2026-09-03 | Hard | Stale S3/DynamoDB lock after apply killed mid-run by VPN drop — recovery procedure | Partial |
| 2026-09-03 | Hard | ↳ FU: what to run, in what order, to see drift while the lock blocks every plan | Fail |
| 2026-09-03 | Hard | ↳ FU: contents of S3 state after SIGKILL between EC2 create and RDS create | Pass |
| 2026-09-03 | Hard | `count` over app list, middle element deleted, plan shows 6 changes not 2 — why | Fail |
| 2026-09-03 | Hard | ↳ FU: literal state address Terraform stores for the `search` repo | Fail |
| 2026-09-03 | Hard | ↳ FU: would `for_each = toset(...)` change that plan, and why | Fail |
| 2026-09-03 | Hard | Manual ALB SG ingress rule (legitimate, must stay) + console-created RDS param group causing `DBParameterGroupAlreadyExists` — resolve both with commands | Partial |
| 2026-09-03 | Hard | ↳ FU: actual command for a drift check and what it does to the state file | Fail |
| 2026-09-03 | Hard | ↳ FU: adopting an existing AWS resource into Terraform without recreating it — name and target | Fail |
| 2026-09-03 | Hard | `apply -var-file=dev.tfvars` run while terminal is on `prod` workspace — what happens, blast radius | Fail |
| 2026-09-03 | Hard | ↳ FU: which S3 state object is read/written and what determines the path | Fail |
| 2026-09-03 | Hard | ↳ FU: does `-var-file` affect state selection; what command selects dev state | Fail |
| 2026-09-03 | Hard | RDS password cleartext in state and in 30-day `-out=tfplan` artifact despite `sensitive = true` — why, and fix | Fail |
