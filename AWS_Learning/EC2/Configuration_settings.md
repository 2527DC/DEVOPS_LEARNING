# Network settings

- Network
- Subnet
- security groups
- Firewall
- Domain join directory

# IAM instance profile

- > How is it done ? --> A role is created by choosing which service of this role must be used like eg -> EC2 , lambda  
  > ect ... . And then a Polices are attached to that role for the permission for to which Aws service it must be authorized eg ... if the Instance level was EC2 and the authorization was enabled for the list of policies added

  > eg -> A EC2 instance attached with the created role where the role has the authorization of attached aws services
  > so that the EC2 does not need the secreats of othere service hardcoded in my application like if my application need to access the data in s3 it doesnt need the secreats as we have already attached the role by attaching the policies of permisison to the role

  > DNS Hostname

# Credit specification ---

- How does this works

* standard : there are two types where u select at the time of createion of the Ec2 instance if by selecting the standard
  every instance has a brake through of the cpu usage like eg if a instance has a brake of 40 % and if ur instance uses only 20 % then the remaing 20% of the cpu usage are converted as created and when the ec2 instance spikes to more than the lmit like 90 % where ur instance limit was 40 and it has exceeded 50 so if there are any createds then thoeswill be used and u will be not payed and if the credits get over at that time the instace get trotelled that is slows down

* unlimited : take the same senario what happens is even the credit are overe and even it exceeds the limit u wont get trottled (slows down ) insted u will be billed for that usage

# Placement group

- cluster
- spread
- partition

---

EBS-optimized instance
Instance bandwidth configuration
