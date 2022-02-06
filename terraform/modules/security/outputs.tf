output "instance_ssh_key_id" {
  value = aws_key_pair.terraform-demo.key_name
}

output "aws_instance_profile" {
  value = aws_iam_instance_profile.dev-resources-iam-profile.name
}