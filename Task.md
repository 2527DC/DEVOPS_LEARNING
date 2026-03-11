1 -> first i need to create ec2 instance manually and look after those things and the uses of the configurations
and necessary of the configuration

🧩 Scenario 1: Public vs Private EC2

Question:
You launch two EC2 instances in the same VPC:

Instance A has a public IP

Instance B does not have a public IP

Both are in the same Availability Zone.

Can Instance A communicate with Instance B?

Which IP address will be used?
Network ACLs must not block it (default allows all)

What AWS components must be configured to allow this communication?
🧩 Scenario 5: Bastion Host Design

Question:
Your company security policy says:

“No production EC2 should be publicly accessible.”

How will engineers SSH into private EC2 instances?

Which instance needs a public IP?

How is traffic routed internally?
