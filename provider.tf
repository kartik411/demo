terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.55.0"
    }
  }
  backend "s3" {
    bucket   = "terr-jenkins-bucket"
    key      = "terraform.tfstate"
    region   = "ap-northeast-1"
  }
}

provider "aws" {
  region = ap-northeast-1
  # Configuration options
}
