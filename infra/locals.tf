locals {
  # Variável para criação da associação das subnets com o route table
  subnet_ids = { for k, v in aws_subnet.pvt_subnet : v.tags.Name => v.id }

  # Tags comuns dos serviços
  common_tags = {
    Project   = "Desafio 2 AWS com Terraform"
    CreatedAt = "2022-03-28"
    ManagedBy = "Terraform"
    Owner     = "Luis Campos"
  }
}