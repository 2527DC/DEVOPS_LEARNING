data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "public" {
  ami                         = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name

  instance_market_options {
    market_type = "spot"
    spot_options {
      spot_instance_type             = "persistent"
      instance_interruption_behavior = "stop"
    }
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-public-instance-${var.environment}"
    Type = "Public"
  })

  user_data = filebase64("${path.module}/user-data-public.sh")
}

resource "aws_instance" "private" {
  ami                    = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[0]
  vpc_security_group_ids = [var.private_security_group_id]
  key_name               = var.key_pair_name

  instance_market_options {
    market_type = "spot"
    spot_options {
      spot_instance_type             = "persistent"
      instance_interruption_behavior = "stop"
    }
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-private-instance-${var.environment}"
    Type = "Private"
  })

  user_data = filebase64("${path.module}/user-data-private.sh")
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[1]
  vpc_security_group_ids      = [var.bastion_security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name

  instance_market_options {
    market_type = "spot"
    spot_options {
      spot_instance_type             = "persistent"
      instance_interruption_behavior = "stop"
    }
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-bastion-instance-${var.environment}"
    Type = "Bastion"
  })

  user_data = filebase64("${path.module}/user-data-bastion.sh")
}

resource "aws_ebs_volume" "private_data" {
  availability_zone = element(split(",", var.private_subnet_ids[0]), 0)
  size              = 20
  type              = "gp3"

  tags = merge(var.tags, {
    Name = "${var.project_name}-private-data-volume-${var.environment}"
  })
}

resource "aws_volume_attachment" "private_data" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.private.id
  volume_id   = aws_ebs_volume.private_data.id
}

resource "aws_launch_template" "private_app" {
  name_prefix   = "${var.project_name}-private-app-${var.environment}-"
  image_id      = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  vpc_security_group_ids = [var.private_security_group_id]

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.project_name}-private-app-${var.environment}"
      Type = "PrivateApp"
    })
  }

  user_data = filebase64("${path.module}/user-data-private-app.sh")
}

resource "aws_autoscaling_group" "private_app" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [aws_lb_target_group.private_app.arn]

  launch_template {
    id      = aws_launch_template.private_app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-private-app-asg-${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.tags["Project"]
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

resource "aws_lb" "private_app" {
  name               = "${var.project_name}-private-app-lb-${var.environment}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.private_subnet_ids

  tags = merge(var.tags, {
    Name = "${var.project_name}-private-app-lb-${var.environment}"
  })
}

resource "aws_lb_target_group" "private_app" {
  name     = "${var.project_name}-private-app-tg-${var.environment}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/health"
    port     = "traffic-port"
    protocol = "HTTP"
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-private-app-tg-${var.environment}"
  })
}

resource "aws_lb_listener" "private_app" {
  load_balancer_arn = aws_lb.private_app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_app.arn
  }
}

