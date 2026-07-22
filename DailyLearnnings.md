# 16-7-26
Java 
Encapsulation ,inheritence, Variables , access Modifiers , Polimorfisam ,
--> Static , Final  keyword behaviour 
Java Script 
- variables  , event loop , micro and macro Queues , 
   Encapsulation  , 
- behaviour of polimorfisam in js ie method overiding  and overloading doesnt happens strictly 
-  All  object are prototyped where all object has a praent object that is protoytpe object

Aws 
- IAM service -> User , Groups , Roles , Policy  are known learnt different one which is identity  providers 
- where we use the identity providers to manage the more than one aws account in one login ie sso login 

Teraform 
-  Learnt basic module in the terraform in to learn ie providers , resource , basic command  
- using the data source for fetching and output for  printing  the values from the  fethed data 
- terraform fmt its to format the  .tf file , alignement , indentation
- terraform validate : where it is used to check the syntax  correction  
    - Attribute validity : Checks if you are using valid argument names inside a resource (e.g., catching a typo like instanse_type instead of instance_type)
- create the user  with directly attaching the policy using terafrom 


# 17-7-26
- Learnt about the kuberneties architecture , and the architecture components , the use of the components and the working an dthe comunication between the composnet and whic is resposnible foe creation of the poad and how is it createed , and the creation of container 
- learnt abut the networking resource in the kubereneties  where it is a flat network 
- controle plane components , worker node components 
- CRI  and containerd 
- Kubelet
- Netwoking 
   - ingreess  and ingress controler what is the use of thise and how they are different 
   - kube proxy  how does it woerk and what does it work 
   - CNI and cni plugins 
   - Network policys 
   - endpoint slice what was the necessary of the endpoint slice 
   - namespaces 
   - Services and its types 
   - ALB  
   - Nat 
   - internet gateway 

 -> why cant    we use the serverless architecture deployment for piston type apliction ( clue : pist uses previlage mode as true )

 # 18-7-26

- learnt the difference between the interface and the abstraction 
   - what type of acces modifier can be used on the fileds an dthe methods 
   - in the interface we can only have public , static , final for the variable
   
- why did interface got interduced while we had abstraction 
- can the static method be overriden 
- got to know the shadowing concept in java  hapens while using the final keyword 
- learnt  why this keyworkds used transite and volatile 
- learnt  how the this keyword in the java script work 
- how the arrow function in js  and the this behavious 
- behaviour or  using of variable in the class level scope 

# 21-7-26

- learnt the  left  joins , right joins and also got to know about  that we dont need the primay or forigin keys  we can just compare  if they have same column type ie datatype 
- Q what if we want to compare  the non datatype what approch should be followed 
- learnt  using the ON clause  
-  learnt the inner joins and  different between the inner joins and the left or right joins 
- lernt about the full joint were it  will return the both the matchedd and unmatched condition row data form  bot the table 


# 22-7-26 

learnt datatype where with the categories of numerics ,initger , small intiger , bigint , numberic for decimal values , real , double presission 
- learnt why the float which is single pression  where in pg we use real as the datatype  and the double pression  should not be used in the  accounting where we use numberic data type 
- got to kow the filters and query like got ot know how is the select and where and the groupby , having , like , Not like , between , not null , IS NULL  ,order by 
- learnt the cross join and self joins 