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

variable "vpc_security_group_ids" {
  type        = list(any)
  description = ""
}

variable "subnet_id" {
  type        = string
  description = ""
}

variable "tags" {
  type        = map(string)
  description = ""
  default = {
    Project   = "KT AWS com Terraform"
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

variable "user_data" {
  type        = string
  description = ""
  default     = ""
}

variable "private_ip" {
  type        = string
  default     = ""
  description = "Range de IPs das subnets publicas"
}