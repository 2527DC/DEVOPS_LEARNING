# Rolling Weak Areas

## Critical Gaps

- **kubectl rollout verification** — Doesn't know `kubectl rollout status` command. This is essential for validating that deployments actually completed and pods became ready, not just that the spec was applied. **Impact:** Missing health checks lead to deployments reporting success while pods are still failing readiness probes. Production can go down without alerting.

## Important Gaps

- **Reusable workflow output syntax** — Initially didn't know the pattern for declaring and accessing outputs across reusable workflows (outputs declared in reusable file, accessed via `needs.<job-name>.outputs.<key>`). **Impact:** Common mistake when extracting jobs to reusable workflows — outputs become unreachable.

## Learning Opportunities

- **Hardcoded vs dynamic refs tradeoff** — Recovered well with probing, but initially didn't distinguish between hardcoding a commit SHA (stable, frozen, good for canary) vs dynamic refs (latest code, good for nightly testing). **Impact:** Wrong choice leads to deployments stuck on old versions or canary deploys changing unpredictably.

## Successfully Demonstrated

- ~~Concurrency mechanics~~ **2026-08-31** — Understood that `cancel-in-progress` doesn't trigger Kubernetes rollback, leaving pods in place.
- ~~Environment secrets and protection rules~~ **2026-08-31** — Knew how to restrict secrets to specific environments and set branch patterns.
- ~~Act vs GitHub Actions environmental differences~~ **2026-08-31** — Identified file access differences and recovery strategies.

