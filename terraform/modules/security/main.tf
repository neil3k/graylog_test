resource "aws_key_pair" "terraform-demo" {
  key_name   = "graylog-demo"
  public_key = file("${path.module}/keys/id_rsa.pub")
}


