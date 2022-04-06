# Criação da VPC
resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.common_tags, { Name = "Terraform VPC" })
}

# Criação do Internet Gateway
resource "aws_internet_gateway" "igtw" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common_tags, { Name = "Terraform IGW" })
}

resource "aws_subnet" "pub_subnet" {
  count                   = length(var.public_subnet_ip)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.azs[count.index]
  cidr_block              = var.public_subnet_ip[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(local.common_tags, { Name = "Public Subnet ${count.index + 1}" })
}

resource "aws_subnet" "pvt_subnet" {
  count             = length(var.private_subnet_ip)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.azs[count.index]
  cidr_block        = var.private_subnet_ip[count.index]
  tags              = merge(local.common_tags, { Name = "Private Subnet ${count.index + 1}" })
}

# Criação da Route Table Public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igtw.id
  }

  tags = merge(local.common_tags, { Name = "Route Table Public" })
}

# Criação da Route Table Private
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common_tags, { Name = "Route Table Private" })
}

# Criação da associação das Subnets na Route Table Publica
resource "aws_route_table_association" "pub_association" {
  count          = length(var.public_subnet_ip)
  subnet_id      = aws_subnet.pub_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

# Criação da associação das Subnets na Route Table Privada
resource "aws_route_table_association" "pvt_association" {
  count          = length(var.private_subnet_ip)
  subnet_id      = aws_subnet.pvt_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}

# resource "aws_eip" "this" {
#   instance = module.aws_instance_ec2_apache.id
#   vpc      = true
# }

# resource "aws_nat_gateway" "this" {
#   allocation_id = aws_eip.this.id
#   subnet_id     = aws_subnet.pvt_subnet.id

#   tags = {
#     Name = "gw NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.igtw]
# }