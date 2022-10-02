terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.21.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = "~> 1.0"
}

provider "aws" {
  region = var.region
  profile = var.aws_profile
  shared_credentials_files = [var.aws_credentials_files]

  default_tags {
    tags = {
      Project   = "Lambdas with Terraform"
      CreatedAt = "10-01-2022"
      ManagedBy = "Terraform"
      Owner     = "Walter Gaitan"
      Env       = var.stage_name
    }
  }
}
