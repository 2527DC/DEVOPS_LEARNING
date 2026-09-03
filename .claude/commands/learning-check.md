---
description: Audit a folder of your notes against interview results and lab history — theory vs practice, what is wrong, what to fix
argument-hint: <folder> — e.g. Tereaform/ | Kubernetes/ | AWS_Learning/ | . for the whole repo
---

Audit the learning material in: **$ARGUMENTS**

Invoke the `learning-check` skill and follow it exactly. Summary of the flow:

1. Read the **whole** target folder, then cross-reference against
   `INTERVIEW/bank/` (what they can defend), `PRACTICE/` (what they have built)
   and `CAREER/` (what they claim).
2. Score five axes 0–10 with evidence: Coverage, Depth, **Accuracy**,
   Practicality, Currency.
3. **Accuracy findings come first** — a wrong note will be confidently repeated
   in an interview. Quote the file, state the error, give the correction.
4. Produce the theory-vs-practice table. Practice is evidenced by `PRACTICE/`
   and real code only — never by the notes claiming something was done.
5. Name the questions an interviewer would ask **because of how these notes are
   written** — the seams. Do not ask them; point at `/interview <topic>`.
6. Audit the system itself: score trends, unticked drills, repeat problems, note rot.
7. Ranked improvement plan, plus a mandatory **what to stop doing**.
8. Log to `LEARNING-CHECK/<folder-slug>-<date>.md` and update its README index.

No praise padding. Lead with the headline finding, cite every claim with a path.
