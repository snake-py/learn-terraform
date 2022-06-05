terraform {
  backend "s3" {
    bucket         = "terraform-state-test-bucket"
    key            = "terraform.tfstate" # the path within the bucket in which file it is stored
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      sousource = "hashicorp/aws"
      version   = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
}


locals {
  example_variable = "example_variable_value"
}

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type
}


