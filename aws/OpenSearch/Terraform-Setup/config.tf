terraform {
  required_version = ">= 1.0"

  # You can override the backend configuration; this is  given as an example.
  backend "s3" {
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.69"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.17.0"
    }
  }
}

provider "aws" {
  # Provide Region here
  region = "eu-north-1"
}