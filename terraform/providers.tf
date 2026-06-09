terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }

    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "~> 4.0"
    # }
  }

  backend "s3" {
    bucket = "bucket-for-tf-remote-backend"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "google" {
    credentials = file("gcp_credentials.json")
    project = local.gcp_project_id
    region  = var.gcp_region
    zone    = var.gcp_zone
}