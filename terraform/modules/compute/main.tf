data "aws_subnet_ids" "this" {
  vpc_id = var.vpc_id

  tags = {
    Tier = "Public"
  }
}


#Get AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["amazon", "self", "aws-marketplace"]

}

#Provision an ALB
resource "aws_lb" "this" {
  name               = "graylog-load-balancer"
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.this.ids

  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn

  port              = 443
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group" "this" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  load_balancing_algorithm_type = "least_outstanding_requests"
  
}

resource "aws_launch_configuration" "Graylog" {
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  user_data                   = file("${path.module}/install_apache.sh")
  security_groups             = [var.security_group_id] 
  key_name                    = var.ssh_key
  iam_instance_profile        = var.aws_instance_profile
  image_id                    = data.aws_ami.ubuntu.id
}