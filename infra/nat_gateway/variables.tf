variable "ami" {
  type        = string
  description = ""
  default     = "ami-033b95fb8079dc481" #AMI Linux
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro" #Free Tier
}

variable "key_name" {
  type        = string
  description = ""
  default     = ""
}

# variable "vpc_security_group_ids" {
#   type        = list(any)
#   description = ""
# }

# variable "subnet_id" {
#   type        = string
#   description = ""
# }

variable "tags" {
  type        = map(string)
  description = ""
  default = {
    Project   = "Instance Nat"
    CreatedAt = "2022-02-05"
    ManagedBy = "Terraform"
    Owner     = "Luis Campos"
  }
}

variable "associate_public_ip_address" {
  type        = string
  description = ""
  default     = true
}

variable "vpc_id" {
  type        = string
  description = ""
  default     = ""
}

variable "public_subnet" {
  type        = list(any)
  description = ""
}

variable "private_subnets_cidr_blocks" {
  type        = list(any)
  description = ""
}

variable "private_route_table_ids" {
  type        = string
  description = ""
  default     = ""
}

variable "name" {
  type        = string
  description = ""
  default     = ""
}