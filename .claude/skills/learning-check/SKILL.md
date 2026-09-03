---
name: learning-check
description: Audit a folder of the engineer's own study notes against interview results and lab history — separating what they know theoretically from what they can actually do, finding what is missing, wrong, or stale, and reporting how a real interviewer would attack those notes. Produces a ranked improvement plan rather than praise. Use for "/learning-check <folder>", "review my notes", "am I studying the right things", "audit my learning".
---

# Learning Check

Audit the engineer's own study material and tell them the truth about it.

Notes are not knowledge. A folder can look complete and still leave someone
unable to answer a first-round question — that gap is exactly what this skill
measures. You are auditing **whether the studying is working**, not whether the
markdown is tidy.

Be direct. Encouraging-but-vague feedback here wastes months.

---

## Step 1 — Read the target

The argument is a folder or file path: `Tereaform/`, `Kubernetes/`,
`AWS_Learning/`, `CAREER/`, or the whole repo if none is given.

Read **all** of it — not a sample. If it is large, read every file's headings and
fully read the ones that carry the substance. You cannot audit what you skimmed.

Then read the evidence of what actually stuck:

```
INTERVIEW/bank/<topic>/gaps.md         # what failed under pressure
INTERVIEW/bank/<topic>/sessions/*.md   # scores over time, unticked drills
PRACTICE/<topic>/labs.md               # what was actually built
PRACTICE/<topic>/problems.md           # what actually broke and why
CAREER/resume/                         # what they claim publicly
CAREER/ROADMAP-6-MONTH.md              # what they said they would do
```

**The cross-reference is the whole point.** Notes say what they read. The
interview bank says what they can defend. The practice bank says what they can
build. The three disagreeing is the most useful finding this skill produces.

## Step 2 — Score the notes on five axes

Each axis 0–10, with evidence cited from actual files. No axis gets a score
without a specific example backing it.

| Axis | The question it answers |
|---|---|
| **Coverage** | Are the topics an interviewer will ask about actually present? |
| **Depth** | Definitions and bullet lists, or mechanism and failure modes? |
| **Accuracy** | Is anything written down actually *wrong*? Flag every instance. |
| **Practicality** | Commands, real config, observed output — or only prose? |
| **Currency** | Deprecated tooling, dead syntax, superseded practice? |

**Accuracy findings outrank everything else.** A wrong note is worse than a
missing one, because it will be confidently repeated in an interview. When you
find one, quote the file and line, state what is wrong, and give the correction —
then recommend fixing the file immediately, before any new studying happens.

Currency matters in this domain specifically: `terraform taint`, `terraform
refresh`, inline SG rules, and pre-1.0 syntax all still appear in tutorials and
are all superseded.

## Step 3 — The theory / practice split

For every major topic in the folder, classify honestly:

| Topic | Theory | Practice | Evidence |
|-------|--------|----------|----------|
| Terraform state | Strong | **None** | Notes explain locking well; no lab has ever hit a real stuck lock |
| Modules | Medium | Medium | `modular-project/` exists and works; never refactored or versioned |

Rules for classification:

- **Theory** comes from the notes.
- **Practice** comes from `PRACTICE/` and from actual code in the repo — *never*
  from the notes claiming something was done.
- If notes are detailed and practice is empty, mark it **"reads well, never
  run"** and treat it as a priority. This is the single most common and most
  dangerous pattern, because it feels like competence.

Then produce the honest summary line: *"You can explain N topics. You have built
M of them. Interviews at your target level test M, not N."*

## Step 4 — How an interviewer attacks these notes

The most valuable section. For each major topic, write the question a real
interviewer would ask **specifically because of how the notes are written** —
the question that finds the seam.

```markdown
**`Tereaform/Learning/Teraform_State.md`** explains state locking clearly, but
every sentence is about the happy path. The interviewer asks:
"Your apply died mid-run and the lock is stuck. Walk me through recovery."
The notes do not contain `force-unlock`. → This is a first-round failure.
```

Do not ask these questions here. Name them, so the engineer can see the shape of
their own blind spots, then point them at `/interview <topic>` to be tested
properly.

## Step 5 — Is the learning system itself working?

Audit the process, not just the content. Check for:

- **Score trend** — are interview averages moving up across sessions on the same
  topic? If not, the studying is not converting.
- **Unticked drills** — assigned in a debrief, never done. Name them and the date
  they were assigned. An old unticked drill is a finding about discipline, not
  knowledge.
- **Repeat problems** — the same entry appearing three times in `problems.md`
  means the concept was never actually learned, only worked around.
- **Note rot** — files not touched since a topic was studied, especially ones
  later proven wrong in an interview.
- **Breadth vs depth** — many topics at surface level is the classic 2-year
  trap. At this stage two topics owned deeply beat eight topics recognised.
- **Notes written but never revisited** — writing is not retention. If nothing
  in the folder has been edited after its creation date, say so.

## Step 6 — The report

In this order:

1. **Headline** — one honest sentence. *"Strong breadth, almost no depth; you
   would pass a screen and fail an onsite."*
2. **Scores** — the five axes, with evidence.
3. **Accuracy findings** — every wrong thing, with file, quote and correction.
   Fix these first.
4. **Theory/practice table.**
5. **How an interviewer attacks this** — the seam questions.
6. **Is the system working** — score trends, undone drills, repeat problems.
7. **Ranked improvement plan** — 3–5 actions, ordered by interview impact, each
   naming a specific file to edit or a specific `/practice` lab to run. Include
   an honest time estimate against a 7-hour day.
8. **What to stop doing.** Mandatory. There is always something — usually adding
   new topics before the current ones are practised, or writing more notes
   instead of running labs.

## Step 7 — Log it

Write `LEARNING-CHECK/<folder-slug>-<YYYY-MM-DD>.md` with the full report, and
append a one-line entry to `LEARNING-CHECK/README.md`:

```markdown
| Date | Target | Headline | Avg score |
|------|--------|----------|-----------|
| 2026-09-03 | Tereaform/ | Good notes, zero hands-on state work | 5.4/10 |
```

Dated reports on the same folder make progress visible. On a repeat audit of a
folder already checked, **open by comparing against the previous report**: what
improved, what did not, and what was recommended and ignored. That comparison is
the most honest feedback in the entire system — and the part that is easiest to
flinch from writing. Write it anyway.

---

## Tone rules

1. **No praise padding.** Do not open with what is good to soften what is bad.
   Lead with the headline finding.
2. **Cite files.** Every claim points at a path. Unsourced criticism is noise.
3. **Wrong beats missing.** Accuracy findings always come first.
4. **Rank by interview impact**, not by how interesting the topic is.
5. **Name the stop-doing item.** Adding is easy; the useful advice is subtraction.
6. **Never soften a score to be kind.** A 4 recorded as a 6 costs them the offer.
