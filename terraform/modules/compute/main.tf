#Get AMI ID

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["amazon", "self", "aws-marketplace"]

}

resource "aws_instance" "Graylog" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  user_data                   = file("${path.module}/install_apache.sh")
  vpc_security_group_ids      = [var.security_group_id] 
  key_name                    = var.ssh_key
}