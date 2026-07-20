#------------------------------------------VPC Module--------------------------------------------------------#
module "vpc_main" {
  source                              = "git::https://github.com/CHERUKURIPRAVEEN/aws-vpc-module.git?ref=v0.12.0"
  region                              = var.region
  application                         = var.application
  application_code                    = var.application_code
  environment                         = var.environment
  environment_code                    = var.environment_code
  vpc_name                            = var.vpc_name
  cidr_block                          = var.cidr_block
  enable_dns_hostnames                = var.enable_dns_hostnames
  public_subnets                      = var.public_subnets
  private_subnets                     = var.private_subnets
  private_dns_hostname_type_on_launch = var.private_dns_hostname_type_on_launch
  map_public_ip_on_launch             = var.map_public_ip_on_launch
  create_nat_gateway                  = var.create_nat_gateway
  single_nat_gateway                  = var.single_nat_gateway
  tags                                = var.tags
}

#------------------------------------------SG Instance--------------------------------------------------------#
module "sg_ssh" {
  source = "git::https://github.com/CHERUKURIPRAVEEN/aws-sg-module.git?ref=v0.4.0"

  description       = "${var.description}-${var.application}"
  required_vpc_name = var.vpc_name
  environment       = var.environment
  application       = var.application
  application_code  = var.application_code
  environment_code  = var.environment_code
  owner             = var.owner
  app_owner         = var.app_owner
  tags              = var.tags

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules

}

# #------------------------------------------EC2 Instance--------------------------------------------------------#
# module "ec2_instance" {
#   source = "git::https://github.com/CHERUKURIPRAVEEN/aws-ec2-module.git?ref=v0.8.0"

#   for_each = var.servers_details

#   ami_name                     = var.ami_name
#   application                  = var.application
#   environment                  = var.environment
#   environment_code             = var.environment_code
#   application_code             = var.application_code
#   instance_role                = var.instance_role
#   key_pair                     = each.value.key_pair
#   project                      = var.project
#   backup                       = var.backup
#   owner                        = var.owner
#   app_owner                    = var.app_owner
#   description                  = var.description
#   availability_zone            = each.value.availability_zone
#   user_data_template_name      = var.user_data_template_name
#   instance_type                = each.value.instance_type
#   os_disk_size                 = each.value.os_disk_size
#   required_vpc_name            = var.required_vpc_name
#   tags                         = var.tags
#   number_of_instances          = var.number_of_instances
#   required_public_subnet_name  = each.value.required_public_subnet_name
#   required_private_subnet_name = each.value.required_private_subnet_name
#   security_groups              = [module.sg_ssh.security_group_id]
# }
