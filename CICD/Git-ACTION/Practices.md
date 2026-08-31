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

#  in practices use 
- matrices , dependencies , self runner , even ( have the knowledge of max events) , conditional  implementation , outputs ,  expressions , context , envrironamnt 

 Advance -> reuseable workflow , composite actions , oidc , deployment envs , manual trigger  , github cli , js actions , concurrency ,workflow dependencies , dynamic matrices ,custom actions 