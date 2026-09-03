# Terraform — Labs

Assigned via `/practice terraform`. Every lab attacks a recorded gap from
`INTERVIEW/bank/terraform/gaps.md`.

| Date | Lab | Attacks | Type | Status | Grade |
|------|-----|---------|------|--------|-------|
| — | — | — | — | — | — |

---

## Queued from the 2026-09-03 interview debrief

These were assigned as drills in `INTERVIEW/bank/terraform/sessions/2026-09-03.md`
and are not yet done. Run `/practice terraform` to get the full lab version of
any of them.

- [ ] **Drill 1 — Watch `count` destroy your infrastructure** (gap #1, PRACTICE)
  In `Tereaform/modular-project/`, create 4 ECR repos with `count`. Apply. Delete
  the middle element. Read the plan **before** applying. Redo with
  `for_each = toset(...)`.
  *Success: you can state from memory why one plan shows 6 changes and the other 2.*

- [ ] **Drill 2 — Break a state lock and recover it** (gap #3, PRACTICE)
  Set up S3 + DynamoDB backend. Start an apply on something slow (RDS). Kill it
  with Ctrl-C twice. Observe the stuck lock in the DynamoDB table, then recover
  with `terraform force-unlock`.
  *Success: you can name the DynamoDB item, its LockID, and recover without docs.*

- [ ] **Drill 3 — Adopt a hand-made resource** (gap #3, PRACTICE)
  Create a security group in the AWS console by hand. Write matching HCL. Run
  apply and watch it fail. Then `terraform import` it and drive `plan` to zero
  changes. Repeat using an `import {}` block with `-generate-config-out`.
  *Success: plan shows "No changes" and you know which file the id was written to.*

- [ ] **Drill 4 — Prove the workspace trap to yourself** (gap #2, BOTH)
  Two workspaces, dev and prod, different instance counts. From the prod
  workspace, run `apply -var-file=dev.tfvars`. Watch it target prod state.
  **Use throwaway resources — this is destructive by design.**
  *Success: you can point at the exact S3 key each workspace wrote to.*

- [ ] **Drill 5 — Find the password in your own state** (gap #4, PRACTICE)
  Create an RDS instance with a password variable marked `sensitive = true`.
  Then `terraform show -json` the state and the saved plan file, and find the
  password in cleartext in both. Rebuild it with `manage_master_user_password`.
  *Success: you can show a colleague the plaintext secret in under 30 seconds.*
