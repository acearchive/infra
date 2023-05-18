terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4.6.0"
    }
  }

  cloud {
    organization = "acearchive"

    workspaces {
      name = "nothingradical"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
