terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
  # Criação do backend do bucket S3
  backend "s3" {
    bucket  = "desafio-terraform-luis"
    key     = "kt/terraform.tfstate"
    region  = "us-east-1"
    profile = "desafio2"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}