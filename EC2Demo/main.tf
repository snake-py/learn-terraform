terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "helloworld" {
  ami           = "ami-053a82fad3faa66b7" # ubuntu 20.04
  instance_type = "t2.micro"
}
