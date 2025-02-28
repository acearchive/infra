resource "cloudflare_zero_trust_access_application" "acearchive_preview" {
  zone_id                   = data.cloudflare_zone.acearchive.id
  name                      = cloudflare_pages_project.acearchive.name
  domain                    = cloudflare_pages_domain.acearchive_dev.domain
  type                      = "self_hosted"
  session_duration          = "720h"
  auto_redirect_to_identity = true
  app_launcher_visible      = false

  policies = []
}

resource "cloudflare_zero_trust_access_policy" "acearchive_preview" {
  zone_id        = data.cloudflare_zone.acearchive.id
  application_id = cloudflare_zero_trust_access_application.acearchive_preview.id
  name           = cloudflare_pages_project.acearchive.name
  decision       = "allow"
  precedence     = 1

  include {
    email = var.cloudflare_access_emails
  }

  require {
    email = var.cloudflare_access_emails
  }
}

# This is defined in a Terraform module from a different unrelated project; we
# only have one of these for the whole account.
#
# That project defines a bulk redirect rule for redirecting the *.pages.dev
# domains to the main domain.
data "cloudflare_list" "pages_dev_domains" {
  account_id = var.cloudflare_account_id
  name       = "pages_dev_domains"
}

resource "cloudflare_list_item" "acearchive_pages_dev_domain" {
  account_id = var.cloudflare_account_id
  list_id    = data.cloudflare_list.pages_dev_domains.id

  redirect = {
  source_url            = "${cloudflare_pages_project.acearchive.subdomain}/"
    target_url            = "https://${cloudflare_pages_domain.acearchive.domain}"
    status_code           = 301
    include_subdomains    = true
    preserve_query_string = true
    subpath_matching      = true
    preserve_path_suffix  = true
}
}

resource "cloudflare_list_item" "hha_pages_dev_domain" {
  account_id = var.cloudflare_account_id
  list_id    = data.cloudflare_list.pages_dev_domains.id

  redirect = {
  source_url            = "${cloudflare_pages_project.hha.subdomain}/"
    target_url            = "https://${cloudflare_pages_domain.hha.domain}"
    status_code           = 301
    include_subdomains    = true
    preserve_query_string = true
    subpath_matching      = true
    preserve_path_suffix  = true
}
}
