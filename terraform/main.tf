#Call the Module which creates our VPC and Subnet.
module "vpc_subnet" {
  source = "../terraform/modules/vpc_subnet"
}

#Creation of Compute infrastructure. (EC2)
module "compute" {
  source = "../terraform/modules/compute"
  
  subnet_id         = module.vpc_subnet.subnet_id
  security_group_id = module.vpc_subnet.security_group_id

  depends_on = [module.vpc_subnet]
}