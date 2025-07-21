terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  backend "s3" {
    bucket = "bucket.terraform.state"
    key    = "challenger.rocketseat.ci.cd/dev/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}