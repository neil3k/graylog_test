#Call the Module which creates our VPC and Subnet.
module "vpc_subnet" {
  source = "../terraform/modules/vpc_subnet"
}