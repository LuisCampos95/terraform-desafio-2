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