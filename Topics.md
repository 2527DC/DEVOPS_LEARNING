This is the File where i keep Track on the Topics that i learn and what are the senarios that i went through to learn things

add
Sqush
merge ---> -X ours , -X theirs , --no-coomit
subtree
submodule
chery pick
commit : --amend , -m
checkout : used to switch the branch and even swithch the branch by creating it if not present

senario 1 : U willl be in a Branch B1 and there will be a remote branch RB1 and you need that code in ur local system
at that time if u switch by creating a new branch locally that branch that u creat will have the code of the branch from the branch where u created it but i dont need that to happen i need a branch replica of the remote Branch RB1 so we can use this cmd to achinve it

          cmd    --->   git checkout -b local_remote_sync_branch origin/RB1

---> here local_remote_sync_branch is the branch where you needed the exact code from the remote branch origin/RB1
