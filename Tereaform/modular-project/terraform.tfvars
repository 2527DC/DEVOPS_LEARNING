sg_egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
]
sg_ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH from anywhere"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }
]
vpc_id             = "vpc-0c8ec78cff0f0728d"
tag_name           = "practice_project"
region             = "ap-south-1"
web_sg_name        = "practice-web-sg"
web_sg_description = " this is the  terafrom base practice security group creation "

# Launch Template Variables
launch_template_name             = "practice-launch-template"
instance_type                    = "t2.micro"
ami_id                           = "ami-01a00762f46d584a1"
key_pair_name                    = "pra-scaling"
cpu_opt_core_count               = 1
cpu_opt_threads_per_core         = 1
credit_specification_cpu_credits = "standard"
capacity_reservation_preference  = "none"
availability_zone                = "ap-south-1a"

# Auto Scaling Variables
auto_scaling_group_name  = "practice-asg"
scaling_min_size         = 1
scaling_max_size         = 2
scaling_desired_capacity = 1
vpc_zone_identifier      = ["subnet-0aabb67b427a0f6d3", "subnet-00a53d9b2add7c8ca"]
target_cpu_utilization   = 50