terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.24.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.33.0"
    }
  }

  cloud {
    organization = "acearchive"

    workspaces {
      name = "acearchive"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "aws" {
  # https://developers.cloudflare.com/r2/examples/terraform/
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true

  endpoints {
    s3 = "https://${var.cloudflare_account_id}.r2.cloudflarestorage.com"
  }
}
