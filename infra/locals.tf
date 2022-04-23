locals {
  # Variável para criação da associação das subnets com o route table

  # Tags comuns dos serviços
  common_tags = {
    Project   = "Desafio 2 AWS com Terraform"
    CreatedAt = "2022-03-28"
    ManagedBy = "Terraform"
    Owner     = "Luis Campos"
  }
}