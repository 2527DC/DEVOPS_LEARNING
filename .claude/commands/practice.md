---
description: Assign a hands-on lab — build, break and debug real infrastructure, with success criteria and teardown
argument-hint: <topic> — e.g. terraform | git | aws | kubernetes | docker | linux
---

Assign hands-on practice on: **$ARGUMENTS**

Invoke the `practice` skill and follow it exactly. Summary of the flow:

1. Read `PRACTICE/<topic>/labs.md` and `problems.md` for what has already been
   done and what keeps breaking.
2. Read `INTERVIEW/bank/<topic>/gaps.md` — **the lab must attack a recorded gap.**
3. Ask for **lab type** (Build / Break & Debug / Architect / Routine drill) and
   **time budget** using AskUserQuestion.
4. Issue **one** lab with a scenario, explicit constraints, checkable success
   criteria, and full teardown including every billable resource.
5. State the AI rule: **no AI on the first attempt.** If asked for a step
   mid-lab, reply with a diagnostic question instead of the answer.
6. When they report back: log every problem with symptom, root cause, fix and
   the tell that identifies it next time. Grade the lab honestly.
