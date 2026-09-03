# 6-Month Roadmap — 2026-09 → 2027-03

**Start:** 2026-09-03 · **Target:** interview-ready by 2027-03-01
**Capacity:** 7 hrs/day · **Immediate target:** ₹18–35 LPA DevOps/Platform role
**Long-term:** ₹1 Cr at 6–8 years, from the seat this plan wins you

---

## The strategic call

You asked which direction is best for your present situation. Here it is, and
it is the one decision in this document that actually matters.

**Do not restart as a generic DevOps candidate. Position as a platform engineer
who can build.**

You have 2 years of React Native and Express. Most people competing for DevOps
roles cannot write an application — they can only deploy one. That is your
edge, and the instinct to discard it as "not DevOps" is wrong. The roles that
pay well at 4–8 years are **platform engineering**: building the tooling,
pipelines and abstractions that other developers consume. That job requires
someone who has been the developer on the other side of the platform.

So the thesis is: *"I build the systems developers deploy onto, and I understand
them because I was one."*

Three consequences for how you study:

1. **Depth over breadth.** Your interview scored 4/10 on a topic your notes
   cover well. The gap is not topics — it is that nothing has been *run*. Two
   topics owned completely beat eight recognised. At 2 years, breadth reads as
   shallow; depth reads as senior.
2. **Everything gets built, nothing only gets read.** The measured failure mode
   in your Terraform round was command fluency — you knew what should happen and
   could not name `force-unlock`, `import`, `workspace select`. That is
   exclusively a hands-on deficit. No amount of reading fixes it.
3. **One capstone, deeply documented.** Not six tutorials. One real system, in
   public, with an architecture diagram, real CI, real cost analysis, and a
   written incident log. That repo is what gets you interviews.

---

## Daily structure (7 hrs)

Six days a week. One full rest day — non-negotiable at this intensity; the
people who burn out at month 3 are the ones who skipped it.

| Block | Hrs | What |
|-------|-----|------|
| **Theory** | 1.5 | Read docs — official only, not tutorials. Write notes *after*, in your own words. |
| **Lab** | 3.5 | `/practice <topic>`. Hands on keyboard. **No AI on the first attempt.** |
| **Review** | 1.0 | Fix your notes with what the lab actually taught you. Log problems hit. |
| **Reps** | 1.0 | Alternate: DSA/coding · system design · `/interview` on a past topic |

**The review hour is the one people skip and it is the one that compounds.**
A note written before the lab is a guess; a note corrected after it is knowledge.

### Weekly rhythm
- **Mon–Fri:** the block structure above
- **Saturday:** one full-day lab (`/practice <topic>` → Full day) — a complete
  build with a fault injected
- **Sunday:** rest. Actually rest.
- **End of each week:** one `/interview <topic>` round on that week's topic

---

## Monthly plan

Each month has an **exit gate**. Do not advance until you pass it. The gate is
measured, not felt: run `/interview <topic>` at **Hard** and score **≥7/10
average**. Your Terraform baseline on 2026-09-03 was **1.8/10** — that is the
number this plan has to move.

### Month 1 (Sep) — Foundations you skipped
Linux, networking, Docker internals, Git beyond the basics.

This is the unglamorous month and the one that separates people. Your notes list
Linux and networking under "main focus" but there is almost nothing written and
nothing built. Every hard DevOps question eventually bottoms out here: a process,
a socket, a namespace, a route.

- Linux: processes, signals, systemd, file descriptors, permissions, `strace`
- Networking: TCP handshake, DNS resolution path, subnetting by hand, `tcpdump`
- Docker: namespaces and cgroups (not just `docker run`), layer caching,
  multi-stage builds, why your image is 1.2 GB
- Git: rebase vs merge, reflog recovery, bisect, hooks

**Gate:** `/interview linux` and `/interview docker` at Hard, ≥7/10.

### Month 2 (Oct) — AWS + Terraform, properly
Your weakest measured area, and the one with an existing bank of recorded gaps.

- Close every open gap in `INTERVIEW/bank/terraform/gaps.md` — all five
- AWS: VPC from scratch by hand *then* in Terraform, IAM policy evaluation
  logic, ALB/ASG, RDS, S3 policies, KMS
- Terraform: `for_each` vs `count` cold, modules with versioning, remote state
  and locking, `import`, `state mv`, drift reconciliation, secrets handling
- Build the `RealWorldScenario.md` three-tier app already in your repo

**Gate:** `/interview terraform` at Hard ≥7/10 **and** `/learning-check Tereaform/`
showing Practicality ≥7.

### Month 3 (Nov) — Kubernetes
The highest-leverage topic for the salary band you are targeting.

- Architecture you can draw from memory; what actually happens on `kubectl apply`
- Networking: Service → Endpoints → kube-proxy → CNI, DNS, Ingress
- Storage, ConfigMaps/Secrets, RBAC
- **Debugging:** CrashLoopBackOff, ImagePullBackOff, pending pods, OOMKills,
  DNS failures — inject each fault deliberately and fix it
- Helm, then ArgoCD (you have an `Argocd/` folder — make it real)

**Gate:** `/interview kubernetes` at Hard ≥7/10.

### Month 4 (Dec) — CI/CD + Observability
Where your dev background becomes a visible advantage.

- GitHub Actions: matrix builds, caching, OIDC to AWS (no long-lived keys),
  reusable workflows, environments and approvals
- A real pipeline: test → build → scan → push → deploy → verify → rollback
- Observability: Prometheus/Grafana, structured logging, distributed tracing,
  SLOs and error budgets, alerts that are actually actionable
- Deliberately break the pipeline in five ways and fix each

**Gate:** `/interview cicd` at Hard ≥7/10 **and** a working pipeline in a public repo.

### Month 5 (Jan) — Capstone + security + cost
**Start applying this month.** Hiring cycles take 4–8 weeks; do not wait until
you feel ready or you will lose two months.

- The capstone: a real application (use your Express/React Native skills)
  deployed on EKS via Terraform, with full CI/CD, monitoring, autoscaling and a
  documented cost breakdown
- Security: OIDC everywhere, least-privilege IAM, secrets management, image
  scanning, `tfsec`/Checkov in CI
- Cost: read the bill, right-size, spot instances, write the tradeoff up
- Write the architecture doc and the incident log

**Gate:** capstone public and documented; `/learning-check .` across the repo.

### Month 6 (Feb) — Interview mode
- `/interview` rounds at **Extreme** across every topic
- System design: rate limiter, URL shortener, notification system, multi-region
- Behavioural stories built from `PRACTICE/*/problems.md` — real failures you
  actually fixed, which is why that file has been accumulating since month 1
- Resume and portfolio rebuilt around the capstone
- Salary negotiation prep

**Gate:** offers.

---

## What to say no to

The plan only works because of what is excluded. At 7 hrs/day for 6 months you
have roughly 900 hours — enough for depth in five areas or a shallow pass at
twenty.

- **No new languages.** Bash and Python are enough. Do not learn Go this year.
- **No certification chasing.** AWS SAA is *optional* and only if a target
  company filters on it. It teaches breadth; you need depth. Six weeks of cert
  study buys less than six weeks of building.
- **No tutorial hell.** If you are watching rather than typing, stop.
- **No new note-taking until existing notes are corrected.** Your Terraform
  workspace file taught you something wrong for weeks. Fix before you add.
- **No tool-hopping.** Learn Terraform, not Terraform-and-Pulumi-and-CDK.

---

## Tracking

| Month | Topic | Gate | Interview score | Passed? |
|-------|-------|------|-----------------|---------|
| 1 | Linux + Docker | ≥7/10 Hard | | |
| 2 | AWS + Terraform | ≥7/10 Hard | (baseline 1.8) | |
| 3 | Kubernetes | ≥7/10 Hard | | |
| 4 | CI/CD + Observability | ≥7/10 Hard | | |
| 5 | Capstone shipped | public + documented | | |
| 6 | Extreme rounds | offers | | |

Update this table after every gate. Run `/learning-check CAREER/` monthly — it
compares what you claim against what the banks prove, and tells you whether the
plan is working or whether you are just busy.

---

## The honest risk

The failure mode for this plan is not laziness — you are clearly willing to work.
It is **doing 7 hours of comfortable input instead of 3 hours of uncomfortable
output.** Reading feels like progress and produces almost none. Every hour you
spend stuck on a broken `terraform apply`, swearing at an error, is worth four
hours of notes.

The system is built to force that: labs with observable success criteria, no AI
on first attempt, and a scorecard that does not care how much you read.
