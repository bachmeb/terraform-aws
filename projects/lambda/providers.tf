provider "aws" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "= 4.48.0"
    }
    archive = {
      source = "hashicorp/archive"
      version = "= 2.2.0"
    }
}
}


