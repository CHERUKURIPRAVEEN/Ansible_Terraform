#------------------------------------------ Global Variables --------------------------------------------------------#
project_name = "VEENTECH"
application  = "veen-app"
project      = "VEENTECH"
backup       = "NonProd"
owner        = "praveen.cherukuri@veen.com"
app_owner    = "praveen.cherukuri@veen.com"
description  = "This is a test EC2 instance created by Terraform module"

#------------------------------------------ VPC Variables --------------------------------------------------------#
region                              = "us-east-1"
environment                         = "TA01"
vpc_name                            = "MANAGEMENT_VPC"
cidr_block                          = "10.11.0.0/16"
enable_dns_hostnames                = true
private_dns_hostname_type_on_launch = "ip-name"
map_public_ip_on_launch             = true
create_nat_gateway                  = false
single_nat_gateway                  = false
public_subnets = [
  { availability_zone = "us-east-1a", cidr_block = "10.11.1.0/24" },
  { availability_zone = "us-east-1b", cidr_block = "10.11.2.0/24" },
  { availability_zone = "us-east-1c", cidr_block = "10.11.3.0/24" }
]
private_subnets = [
  { availability_zone = "us-east-1a", cidr_block = "10.11.10.0/24" },
  { availability_zone = "us-east-1b", cidr_block = "10.11.11.0/24" }
]

#------------------------------------------ EC2 Variables --------------------------------------------------------#
ami_name                     = "Jenkins-Server-Image"
os_disk_size                 = 30
instance_type                = "t3.micro"
required_vpc_name            = "MANAGEMENT_VPC"
availability_zone            = "us-east-1a"
user_data_template_name      = "userdata"
key_pair                     = "tf-key-pair"
number_of_instances          = 1
required_public_subnet_name  = "public"
required_private_subnet_name = ""
instance_role                = "V-EC2-SSM"
servers_details = {
  server1 = {
    instance_type                = "t3.micro"
    os_disk_size                 = 30
    key_pair                     = "tf-key-pair"
    required_public_subnet_name  = "public"
    required_private_subnet_name = ""
    availability_zone            = "us-east-1a"
  }
}

#------------------------------------------ SG Variables --------------------------------------------------------#
ingress_rules = [
  {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_ipv4   = "0.0.0.0/0"
    description = "SSH access"
  },
  {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_ipv4   = "0.0.0.0/0"
    description = "HTTP access"
  },
  {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_ipv4   = "0.0.0.0/0"
    description = "HTTPS access"
  }
]

egress_rules = [
  {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_ipv4   = "0.0.0.0/0"
    description = "All outbound traffic"
  }
]