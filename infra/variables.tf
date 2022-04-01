variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1" #Região Norte da Virgínia
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "desafio2" #Profile criado na configuração da AWS
}

variable "ami" {
  type        = string
  description = ""
  default     = "ami-0c02fb55956c7d316" #AMI Linux
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro" #Free Tier
}

variable "server_apache" {
  type    = list(any)
  default = ["apache1.sh", "apache2.sh", "apache3.sh"]
}

variable "server_nginx" {
  type    = string
  default = "nginx.sh"
}

variable "azs" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_ip" {
  type        = list(any)
  default     = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  description = "Range de IPs das subnets publicas"
}

variable "private_subnet_ip" {
  type        = list(any)
  default     = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
  description = "Range de IPs das subnets privadas"
}

variable "ingress_ports_apache" {
  description = "Allowed Ec2 ports"
  type        = map(any)
  default = {
    "80" = ["0.0.0.0/0"]
    "22" = ["0.0.0.0/0"]
  }
}

variable "egress_ports_apache" {
  description = "Allowed Ec2 ports"
  type        = map(any)
  default = {
    "0" = ["0.0.0.0/0"]
  }
}

variable "ingress_ports_nginx" {
  description = "Allowed Ec2 ports"
  type        = map(any)
  default = {
    "80" = ["0.0.0.0/0"]
    "22" = ["0.0.0.0/0"]
  }
}

variable "egress_ports_nginx" {
  description = "Allowed Ec2 ports"
  type        = map(any)
  default = {
    "0" = ["0.0.0.0/0"]
  }
}