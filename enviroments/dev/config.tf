terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  backend "s3" {
    bucket = "challenger.rocketseat.ci.cd.terraform.state"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}