---
description: Run a mock technical interview on one topic, with follow-ups and a scored session log
argument-hint: <topic> [follow-ups] — e.g. kubernetes | cicd | terraform 3
---

Conduct a mock interview on: **$ARGUMENTS**

The first word is the topic (kubernetes, cicd, terraform, java, javascript, sql,
docker, linux, aws, kafka, system-design, bash, dsa, project, hr — or anything
else the candidate names). An optional number sets follow-ups per question;
default is 2.

Invoke the `interviewer` skill and follow it exactly. Summary of the flow:

1. Read `INTERVIEW/bank/<topic>/asked.md` so you never repeat a question.
2. Read the candidate's own notes for that topic to calibrate difficulty.
3. Ask for **difficulty** and **number of questions** using AskUserQuestion.
4. Ask **one** scenario question. Wait. Then follow up on their actual answer
   the configured number of times before moving on.
5. Never reveal an answer mid-interview.
6. At the end: scorecard, then write the session log and update `asked.md`.
