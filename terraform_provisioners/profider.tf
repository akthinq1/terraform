terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  # create s3 bucket for remote state
  backend "s3"{
    bucket = "akdevops-terraform-remote-state"
    key = "provisoners"
    region = "us-east-1"
    encrypt = true
    # use_lockfile=false
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
}