# Interview Bank

Written and maintained by the `/interview` command (`.claude/skills/interviewer/`).

## Layout

```
INTERVIEW/bank/
  <topic>/
    asked.md      # every question ever asked — the no-repeat registry
    gaps.md       # rolling weak areas, drives what gets asked next time
    sessions/
      YYYY-MM-DD.md   # full log: question, my answer, follow-ups, model answer
```

One folder per topic slug: `kubernetes`, `cicd`, `terraform`, `docker`,
`linux`, `aws`, `java`, `javascript`, `sql`, `kafka`, `bash`, `system-design`,
`project`, `hr` — created on first use.

## Rules

- **`asked.md` is the contract.** Nothing in it gets asked again unless the
  candidate explicitly says "repeat questions" or "reset the bank".
- **`gaps.md` is the target list.** Anything unresolved there is fair game at
  the same or higher difficulty next round.
- **Sessions are append-only history.** Do not edit past answers — the point is
  seeing the difference between the 31 Aug answer and the one a month later.

## Usage

```
/interview kubernetes        # 2 follow-ups per question (default)
/interview cicd 3            # 3 follow-ups per question
/interview terraform
```

The command asks for difficulty (Easy / Hard / Extreme) and question count
before starting.
