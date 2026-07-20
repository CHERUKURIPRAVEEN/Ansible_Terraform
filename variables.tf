#----------------------------------- Common Variables ---------------------------------------#

variable "region" {
  description = "region details"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "default tags"
  type        = map(string)
  default = {
    "env" = "np"
  }
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "Dev"

  validation {
    condition     = contains(["Dev", "Qa", "Stage", "PreProd", "Production"], var.environment)
    error_message = "Environment should be 'Dev','Qa','Stage','PreProd','Production'"
  }
}

variable "application_code" {
  description = "Application Code"
  type        = string

  validation {
    condition     = length(var.application_code) > 3
    error_message = "application code should be minimum of 4 characters"
  }
}

variable "environment_code" {
  description = "Environment Code"
  type        = string

  validation {
    condition     = length(var.environment_code) > 2
    error_message = "Environment code should be minimum of 3 characters"
  }
}

variable "application" {
  description = "Application tag value for the EC2 instance. Minimum of 8 characters."
  type        = string

  validation {
    condition     = length(var.application) > 7
    error_message = "application value should be minimum of 8 characters"
  }
}

#-------------------------------------- VPC Variables -----------------------------------------#
variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "VPC_BY_TF"

  validation {
    condition     = length(var.vpc_name) > 9
    error_message = "VPC name should be minimum of 10 characters."
  }

  validation {
    condition     = can(regex("^[A-Za-z0-9_-]+$", var.vpc_name))
    error_message = "VPC name should contain only alphanumeric characters, hyphens, and underscores."
  }
}

variable "create_nat_gateway" {
  description = "Create EIP and NAT Gateway"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "cidr_block" {
  description = "CIDR range"
  type        = string
  default     = "10.1.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "dns hostname enable"
  type        = bool
  default     = false
}

variable "public_subnets" {
  description = " A list of map avaliability_zones, cidr_block for each availability zone inside vpc"
  type = list(object({
    availability_zone = string
    cidr_block        = string
  }))
  default = []
}

variable "private_dns_hostname_type_on_launch" {
  description = "Private host name on launch"
  type        = string
  default     = "ip-name"
}

variable "map_public_ip_on_launch" {
  description = "Public IP on launch"
  type        = bool
  default     = false
}

variable "private_subnets" {
  description = " A list of map avaliability_zones, cidr_block for each availability zone inside vpc"
  type = list(object({
    availability_zone = string
    cidr_block        = string
  }))
  default = []
}

#-------------------------------------- EC2 Variables -----------------------------------------#

# variable "ami_name" {
#   description = "AMI Name"
#   type        = string
#   default     = "ubuntu"
# }

# variable "project" {
#   description = "Project for which EC2 instance is being created"
#   type        = string
#   default     = ""

#   validation {
#     condition     = length(var.project) > 7 || var.project == ""
#     error_message = "Project value should be minimum of 8 characters or empty"
#   }
# }

# variable "backup" {
#   description = "Backup to which the EC2 instance belongs. Possible values: 'N/A', 'NonProd', 'Prod'"
#   type        = string
#   default     = "N/A"

#   validation {
#     condition     = contains(["N/A", "NonProd", "Prod"], var.backup)
#     error_message = "Backup must be only these values 'N/A', 'NonProd', 'Prod'."
#   }
# }

# variable "owner" {
#   description = "Email address of the EC2 instance owner."
#   type        = string

#   validation {
#     condition     = can(regex("^[A-Za-z0-9._%+-]+@veen\\.com$", var.owner))
#     error_message = "Owner email must be a valid @veen.com address."
#   }
# }

# variable "app_owner" {
#   description = "Email address of the application owner."
#   type        = string

#   validation {
#     condition     = can(regex("^[A-Za-z0-9._%+-]+@veen\\.com$", var.app_owner))
#     error_message = "Application owner email must be a valid @veen.com address."
#   }
# }

# variable "description" {
#   description = "Description for which EC2 instance is being created"
#   type        = string

#   validation {
#     condition     = length(var.description) > 9
#     error_message = "Description value should be minimum of 10 characters"
#   }
# }

# # variable "availability_zone" {
# #   type    = string
# #   default = "us-east-1a"
# # }

# variable "required_vpc_name" {
#   description = "vpc name"
#   type        = string
#   default     = "MANAGEMENT_VPC"

#   validation {
#     condition     = contains(["MANAGEMENT_VPC", "DEV_VPC", "STAGE_VPC", "PREPROD_VPC", "PRODUCTION_VPC"], var.required_vpc_name)
#     error_message = "VPC name should be one of the allowed values."
#   }
# }

# # variable "instance_type" {
# #   description = "EC2 instance type"
# #   type        = string
# #   default     = "t3.micro"
# # }

# variable "instance_role" {
#   description = "Instance role for the EC2 instance"
#   type        = string
#   default     = null
# }

# # variable "security_groups" {
# #   description = "Security Group to be included on the EC2 instance."
# #   type        = list(any)
# #   default     = []
# # }

# # variable "key_pair" {
# #   description = "Keypair to be used on the EC2 instance."
# #   type        = string
# #   default     = "MANAGED_KEY"
# # }

# variable "number_of_instances" {
#   description = "Number of EC2 instances to be created."
#   type        = number
#   default     = 1

#   validation {
#     condition     = can(regex("^[0-9]{1,2}$", var.number_of_instances))
#     error_message = "Number of instances value should be number."
#   }
# }

# variable "user_data_template_name" {
#   description = "Name of the user data template file (without extension)"
#   type        = string
#   default     = "userdata"
# }

# # variable "os_disk_size" {
# #   description = "Size of the OS disk in GB"
# #   type        = number
# #   default     = 30
# # }

# # variable "required_public_subnet_name" {
# #   description = "Provide the pattern for the required public subnet name"
# #   type        = string
# #   default     = ""
# # }

# # variable "required_private_subnet_name" {
# #   description = "Provide the pattern for the required private subnet name"
# #   type        = string
# #   default     = ""
# # }

# variable "servers_details" {
#   description = "Application server definitions"
#   type = map(object({
#     instance_type                = string
#     os_disk_size                 = number
#     required_public_subnet_name  = string
#     required_private_subnet_name = string
#     availability_zone            = string
#     key_pair                     = string
#   }))
# }

# #-------------------------------------- SG Variables -----------------------------------------#

# variable "ingress_rules" {
#   type = list(object({
#     protocol    = string
#     from_port   = number
#     to_port     = number
#     cidr_ipv4   = optional(string)
#     description = optional(string)
#   }))
# }

# variable "egress_rules" {
#   type = list(object({
#     protocol    = string
#     from_port   = number
#     to_port     = number
#     cidr_ipv4   = optional(string)
#     description = optional(string)
#   }))
# }