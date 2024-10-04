# Security Group for Load Balancer and EC2 Instances
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.owner}-us1-${var.environment}-alb-sg"
  }
}

resource "aws_launch_template" "web_launch_template" {
  name_prefix   = "web-server-"
  image_id      = var.ami_id
  instance_type = "t2.micro"

  tags = local.common_tags

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.alb_sg.id]
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 2
  min_size             = 1
  health_check_type    = "ELB"
  health_check_grace_period = 300
  launch_template {
    id      = aws_launch_template.web_launch_template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.pub_subnet_01.id, aws_subnet.pub_subnet_02.id]

  target_group_arns = [aws_lb_target_group.web_target_group.arn]

}