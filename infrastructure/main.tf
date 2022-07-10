terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

#configure remote backend s3
terraform {
  backend "s3" {
    bucket = "app-react-cinema-tf-state"
    key    = "app-cinema.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}

#local variables
locals {
    prefix = "${var.prefix}-${terraform.workspace}"
    common_tags = {
        Environment = terraform.workspace
        Project = var.project
        ManagedBy = "Terraform"
        Owner = "Roshan"
    }
}