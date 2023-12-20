terraform {
  backend "s3" {
    bucket         = "devops-tf-bc"
    key            = "adminer/web-app/terraform.tfstate"
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

variable "db_pass_1" {
  description = "password for database"
  type        = string
  sensitive   = true
}

module "web_app_1" {
  source = "../web-app-module"

  # Input Variables
  app_name         = "web-app-1"
  environment_name = "production"
  instance_type    = "t2.micro"
  db_name          = "webapp1db"
  db_user          = "foo"
  db_pass          = var.db_pass_1
}
