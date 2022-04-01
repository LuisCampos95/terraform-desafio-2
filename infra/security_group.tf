resource "aws_security_group" "ec2_rules_apache" {

  name   = "sg_rules_apache"
  tags   = merge(local.common_tags, { Name = "SG Apache" })
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports_apache
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports_apache
    content {
      from_port   = egress.key
      to_port     = egress.key
      cidr_blocks = egress.value
      protocol    = "-1"
    }
  }
}

resource "aws_security_group" "ec2_rules_nginx" {

  name   = "sg_rules_nginx"
  tags   = merge(local.common_tags, { Name = "SG Nginx" })
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports_nginx
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports_nginx
    content {
      from_port   = egress.key
      to_port     = egress.key
      cidr_blocks = egress.value
      protocol    = "-1"
    }
  }
}

# Criação do Security Group
resource "aws_security_group" "sg" {
  name        = "SG Terraform"
  description = "Allow public inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  tags        = merge(local.common_tags, { Name = "SG Nginx" })
  # Habilitando portas de entrada
  ingress {
    from_port   = 80 #HTTP
    to_port     = 80 #HTTP
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Liberando todos os IPs
  }
  # Habilitando portas de entrada
  ingress {
    from_port   = 22 #SSH
    to_port     = 22 #SSH
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Liberando todos os IPs
  }
  # Habilitando portas de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #Liberando todos os IPs
  }
}