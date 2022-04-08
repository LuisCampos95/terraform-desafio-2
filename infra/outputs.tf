# Saídas a serem visualizadas nos logs
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igtw.id
}

output "subnet_ids" {
  value = { for k, v in aws_subnet.pvt_subnet : v.tags.Name => v.id }
}

output "sg_id" {
  value = aws_security_group.ec2_rules_apache.id
}

output "public_ip" {
  value = module.aws_instance_ec2_nginx.public_ip
  depends_on = [
    module.aws_instance_ec2_nginx
  ]
}

output "private_ip" {
  value = module.aws_instance_ec2_apache[*].private_ip
  depends_on = [
    module.aws_instance_ec2_apache
  ]
}

output "ssh" {
  value = module.aws_instance_ec2_nginx.ssh
  depends_on = [
    module.aws_instance_ec2_nginx
  ]
}