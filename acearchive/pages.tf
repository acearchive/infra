resource "cloudflare_pages_project" "hha" {
  account_id        = var.cloudflare_account_id
  name              = "hha-archive"
  production_branch = "main"

  build_config {
    build_command   = "bash ./build.sh"
    destination_dir = "public"
  }

  source {
    type = "github"

    config {
      owner                         = "acearchive"
      repo_name                     = "hha-archive"
      production_branch             = "main"
      pr_comments_enabled           = false
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        GO_VERSION   = "1.21"
        NODE_VERSION = "18.18.2"
      }
    }

    preview {
      environment_variables = {
        GO_VERSION   = "1.21"
        NODE_VERSION = "18.18.2"
      }
    }
  }
}

resource "cloudflare_pages_domain" "hha" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.hha.name
  domain       = "hha.${data.cloudflare_zone.acearchive.name}"
}
