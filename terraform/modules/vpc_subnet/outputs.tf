output "subnet_arn" {
  value = aws_subnet.this.arn
}

output "subnet_id" {
  value = aws_subnet.this.id
}

output "vpc_arn" {
  value = aws_vpc.Website_Default.arn
}

output "security_group_id" {
  value = aws_security_group.inbound_ssh_and_http.id
}