resource "aws_autoscaling_group" "autoscale_group" {
  vpc_zone_identifier = [aws_subnet.private_subnet_a.id , aws_subnet.private_subnet_b.id]
  min_size = 2
  max_size = 3
  desired_capacity = 2
  health_check_type = "ELB"
  health_check_grace_period = 500

  launch_template {
    id      = aws_launch_template.template_terraform.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "template_terraform" {
  name                   = var.launch_template_name
  instance_type          = var.instance_type
  image_id               = var.ami

  vpc_security_group_ids = [aws_security_group.instance.id]
  
  iam_instance_profile {
    arn = aws_iam_instance_profile.ecs.arn
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "dev"
    }
  }

  user_data = filebase64("example.sh")
}

