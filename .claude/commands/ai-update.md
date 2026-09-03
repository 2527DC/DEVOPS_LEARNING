---
description: What AI tooling is actually used in production DevOps for a given scope, what problem each solves, and what to ignore
argument-hint: <scope> — iac | cicd | cloud-automation | version-control | observability | reliability | security | kubernetes | cost | all
---

Report on AI tooling for the scope: **$ARGUMENTS**

Invoke the `ai-update` skill and follow it exactly. Summary of the flow:

1. **Search the web first.** This landscape changes monthly; never answer from
   memory alone. Flag anything you cannot confirm is still maintained.
2. Report what changed recently in this scope, dated.
3. For each tool that matters: the **problem it solves**, how it works, **where
   it fails**, real adoption level, and a Learn / Know it exists / Skip verdict.
   Never a bare list of names.
4. Include the **hype filter** — what to deliberately ignore, and why.
5. Say what the AI now does in this scope, and what therefore becomes more
   valuable for a human engineer to own.
6. Close with **one** concrete action for this week, then log the report to
   `AI-TOOLING/<scope>.md` with newest entry on top.

Rank ruthlessly. Recommending five tools to learn is the same as recommending none.
