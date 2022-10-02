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

  # This argument is deprecated, but still necessary. See this issue:
  # https://github.com/cloudflare/terraform-provider-cloudflare/issues/1365
  account_id = var.cloudflare_account_id
}

# https://developers.cloudflare.com/r2/examples/terraform/
provider "aws" {
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true

  region = "auto"
  access_key = var.r2_access_key_id
  secret_key = var.r2_secret_access_key

  endpoints {
    s3 = "https://${var.cloudflare_account_id}.r2.cloudflarestorage.com"
  }
}
