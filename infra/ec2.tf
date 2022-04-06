# Criação da key pair
resource "aws_key_pair" "my_key" {
  key_name   = "aws_key"
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

module "aws_instance_ec2_apache" {
  source = "./module_ec2"

  count                  = length(var.private_subnet_ip)
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_rules_nginx.id]
  subnet_id              = aws_subnet.pub_subnet[count.index].id
  user_data              = file(var.server_apache[count.index])

  tags = merge(local.common_tags, { Name = "Instance Apache ${count.index + 1}" })
}

module "aws_instance_ec2_nginx" {
  source = "./module_ec2"

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_rules_nginx.id]
  subnet_id              = aws_subnet.pub_subnet[2].id
  user_data              = file("nginx.sh")

  tags = merge(local.common_tags, { Name = "Instance Nginx" })
}