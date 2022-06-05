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

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-state-test-bucket"
  force_destroy = true
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID" ## Needs to be set !
  attribute {
    name = "LockID"
    type = "S"
  }
}



