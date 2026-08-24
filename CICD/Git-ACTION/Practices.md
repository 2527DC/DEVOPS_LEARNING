1. Deployment succeeded but application is down
- learn  on what condition or things this senario may occure and how is it handled in production 
2. Production deployment succeeds but wrong version is deployeds 
3. Two deployments happen simultaneouslys
4. Scenario 8 — Deployment halfway succeeds ( what senario can end up to this behavior  one may be internet issue   )
        1. Pull image       ✅
        2. Stop old app     ✅
        3. Start new app    ❌

  You need to understand:
   - Rolling deployment
Blue/Green deployment
Canary deployment
Health checks
Automatic rollback
Manual rollback
Deployment strategies      