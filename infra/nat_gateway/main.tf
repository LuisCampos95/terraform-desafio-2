# Resource criado para o módulo do EC2
resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  # vpc_security_group_ids      = var.vpc_security_group_ids
  # subnet_id                   = var.subnet_id
  tags                        = var.tags
  associate_public_ip_address = var.associate_public_ip_address
  # vpc_id                      = var.vpc
  # public_subnet               = var.public_subnet
  # private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
  # private_route_table_ids     = var.private_route_table_ids
}