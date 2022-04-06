terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Criação do Bucket S3
resource "aws_s3_bucket" "kt-terraform" {
  bucket = "desafio-terraform-luis" #Nome do Bucket
  force_destroy = true

  # Habilitando o versionamento
  versioning {
    enabled = true
  }
  # Tags do Bucket
  tags = {
    Description = "Armazenamento do arquivo do terraform.tfstate"
    ManagedBy   = "Terraform"
    Owner       = "Luis Campos"
    CreatedAt   = "2022-02-05"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket              = aws_s3_bucket.kt-terraform.id
  block_public_acls   = true
  block_public_policy = true
}
