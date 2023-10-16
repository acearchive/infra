resource "cloudflare_pages_project" "nothingradical" {
  account_id        = var.cloudflare_account_id
  name              = "nothingradical-blog"
  production_branch = "main"

  build_config {
    build_command   = "hugo"
    destination_dir = "public"
  }

  source {
    type = "github"

    config {
      owner                         = "frawleyskid"
      repo_name                     = "nothingradical.blog"
      production_branch             = "main"
      pr_comments_enabled           = false
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_includes       = ["dev"]
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        HUGO_VERSION = "0.119.0"
      }
    }

    preview {
      environment_variables = {
        HUGO_BASEURL = "/"
        HUGO_VERSION = "0.119.0"
      }
    }
  }
}

resource "cloudflare_pages_domain" "nothingradical" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.nothingradical.name
  domain       = "nothingradical.blog"
}
