output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc_main.vpc_id
}

# output "private_ips" {
#   value = {
#     for name, mod in module.ec2_instance :
#     name => mod.private_ips
#   }
# }

# output "aws_internet_gateway_id" {
#   description = "INTERNET GATEWAY ID"
#   value       = module.vpc_main.aws_internet_gateway_id
# }
# output "aws_route_table_public_id" {
#   description = "PUBLIC ROUTE TABLE ID"
#   value       = module.vpc_main.aws_route_table_public_id
# }
# output "aws_route_table_private_id" {
#   description = "PRIVATE ROUTE TABLE ID"
#   value       = module.vpc_main.aws_route_table_private_id
# }
# output "public_subnet_ids" {
#   description = "The IDs of the public subnets"
#   value       = module.vpc_main.public_subnet_ids
# }
# output "private_subnet_ids" {
#   description = "The IDs of the private subnets"
#   value       = module.vpc_main.private_subnet_ids
# }