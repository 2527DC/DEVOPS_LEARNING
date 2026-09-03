# PRACTICE

Hands-on lab work. Run `/practice <topic>` to get assigned a lab.

This directory answers a different question from `INTERVIEW/bank/`:

| Directory | Question it answers |
|---|---|
| `INTERVIEW/bank/` | What can you **defend** under pressure? |
| `PRACTICE/` | What have you actually **built and broken**? |
| Your notes (`Tereaform/`, `Kubernetes/`, …) | What have you **read**? |

When these three disagree, the truth is whichever one is lowest. `/learning-check`
exists to find that disagreement.

## Structure

```
PRACTICE/
  <topic>/
    labs.md       # every lab assigned: date, gap attacked, status, grade
    problems.md   # every problem hit, root cause, fix, how to spot it next time
```

## The AI rule

**No AI on the first attempt.** Official docs, `--help`, your own notes, and the
error on your screen. That is it.

Come back to Claude when the lab is done, or when you have been stuck on one
error for 30+ minutes. If you ask for a step mid-lab you will get a diagnostic
question back, not the answer — that is deliberate.

The reason: the market has plenty of engineers who can prompt an AI into working
config and cannot debug it when it breaks at 2am. The entire value of the role is
being the person who owns the system when the tooling stops helping.

## Why `problems.md` is the most important file here

Every problem you hit gets logged with its root cause and fix. Six months of that
is a personal, searchable record of real failures you have resolved.

It is also your behavioural interview material. "Tell me about a time something
broke" gets answered from this file — with specifics, which is the only version
of that answer that lands.

## Topics

| Topic | Labs done | Open gaps | Last lab |
|-------|-----------|-----------|----------|
| terraform | 0 | 5 | — |
