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

# Criação das Subnets
# resource "aws_subnet" "subnet" {
#   for_each = {
#     "pub_a" : ["192.168.1.0/24", "${var.aws_region}a", "Public A"]
#     "pub_b" : ["192.168.2.0/24", "${var.aws_region}b", "Public B"]
#     "pub_c" : ["192.168.3.0/24", "${var.aws_region}c", "Public C"]
#     "pvt_a" : ["192.168.4.0/24", "${var.aws_region}a", "Private A"]
#     "pvt_b" : ["192.168.5.0/24", "${var.aws_region}b", "Private B"]
#     "pvt_c" : ["192.168.6.0/24", "${var.aws_region}c", "Private C"]
#   }

#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = each.value[0]
#   availability_zone = each.value[1]
#   tags              = merge(local.common_tags, { Name = each.value[2] })
# }

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
  tags = merge(local.common_tags, { Name = "Route Table Private" })
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

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.pvt_subnet.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igtw]
}