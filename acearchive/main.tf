terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.24.0"
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
