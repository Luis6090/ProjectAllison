terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  required_version = "~> 1.11.2"
}


provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment         = upper("${var.environment}")
    }
  }
}
