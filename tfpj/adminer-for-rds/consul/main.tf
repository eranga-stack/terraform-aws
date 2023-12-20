terraform {
  backend "s3" {
    bucket         = "devops-tf-bc"
    key            = "adminer/consul/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "consul" {
   source = "hashicorp/consul/aws"
   version = "0.11.0"
}
