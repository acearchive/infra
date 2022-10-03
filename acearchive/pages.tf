resource "cloudflare_pages_project" "acearchive" {
  account_id        = var.cloudflare_account_id
  name              = "acearchive-lgbt"
  production_branch = "main"

  build_config {
    build_command = "npm install && npm run build"
    destination_dir = "public"
  }

  source {
    type = "github"

    config {
      owner = "acearchive"
      repo_name = "acearchive.lgbt"
      production_branch = "main"
      pr_comments_enabled = true
      deployments_enabled = true
      production_deployment_enabled = true
      preview_deployment_setting = "custom"
      preview_branch_includes = ["dev"]
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        HUGO_VERSION = "0.104.0"
      }

      r2_buckets = {
        ARTIFACTS = aws_s3_bucket.artifacts.bucket
      }
    }

    preview {
      environment_variables = {
        HUGO_BASEURL = "/"
        HUGO_VERSION = "0.104.0"
      }

      r2_buckets = {
        ARTIFACTS = aws_s3_bucket.artifacts.bucket
      }
    }
  }
}

resource "cloudflare_pages_project" "hha" {
  account_id        = var.cloudflare_account_id
  name              = "hha-archive"
  production_branch = "main"

  build_config {
    build_command = "bash ./build.sh"
    destination_dir = "public"
  }

  source {
    type = "github"

    config {
      owner = "acearchive"
      repo_name = "hha-archive"
      production_branch = "main"
      pr_comments_enabled = false
      deployments_enabled = true
      production_deployment_enabled = true
      preview_deployment_setting = "custom"
      preview_branch_includes = ["dev"]
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        GO_VERSION = "1.17"
        NODE_VERSION = "17.2.0"
      }
    }

    preview {
      environment_variables = {
        GO_VERSION = "1.17"
        NODE_VERSION = "17.2.0"
      }
    }
  }
}

// I'm currently getting the following error trying to apply this resource:
//
// ```
// Error: error creating domain for project "REDACTED": Domain is unavailable
// (8000018)
// ```
//
// Someone has opened an issue on GitHub:
//
// https://github.com/cloudflare/terraform-provider-cloudflare/issues/1946
//
// Interestingly, applying this resource does seem to create the domain in
// Cloudflare, but it still fails in Terraform.

/*
resource "cloudflare_pages_domain" "acearchive" {
  account_id = var.cloudflare_account_id
  project_name = cloudflare_pages_project.acearchive.name
  domain = "acearchive.lgbt"
}
*/

resource "cloudflare_pages_domain" "hha" {
  account_id = var.cloudflare_account_id
  project_name = cloudflare_pages_project.hha.name
  domain = "hha.acearchive.lgbt"
}
