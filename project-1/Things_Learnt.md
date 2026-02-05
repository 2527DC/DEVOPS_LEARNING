**Scenario-Based Question:**

You have an EC2 instance in your infrastructure with a security group already attached. This security group has existing ingress and egress rules. You want to update the security group rules using Terraform.

1. **What will happen if you try to directly modify the ingress or egress rules of the existing security group in Terraform and run `apply`?**
   **Answer:** Terraform will either show “no changes” or fail with a dependency violation error because the security group is already attached to a running instance and has existing rules.

2. **Why does attempting to destroy the old security group fail when it is attached to a running instance?**
   **Answer:** Destroying the security group will fail because it is currently in use by the instance. AWS does not allow deletion of a security group that is attached to any running resource.

3. **What is the correct approach to update the security group rules without causing a dependency violation error?**
   **Answer:**

   - Create a **new security group** with the desired rules.
   - Attach the new security group to the instance.
   - Remove the old security group from the Terraform code and run `apply`. This will safely delete the old security group.

4. **How can you safely add ingress and egress rules to a security group that was initially attached to the instance without any rules?**
   **Answer:** If the security group was initially attached without specifying ingress or egress rules, you can later add ingress and egress blocks in Terraform and run `apply`. Terraform will update the security group with the new rules without causing a dependency violation.
