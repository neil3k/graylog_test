output "instance_ssh_key_id" {
  value = aws_key_pair.terraform-demo.key_name
}