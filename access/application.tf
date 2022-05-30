resource "cloudflare_access_application" "acearchive" {
  account_id = var.cloudflare_account_id
  name = "acearchive-lgbt"
  domain = "*.acearchive-lgbt.pages.dev"
}

resource "cloudflare_access_application" "hha" {
  account_id = var.cloudflare_account_id
  name = "hha-archive"
  domain = "*.hha-archive.pages.dev"
}

resource "cloudflare_access_application" "nothingradical" {
  account_id = var.cloudflare_account_id
  name = "nothingradical-blog"
  domain = "*.nothingradical-blog.pages.dev"
}
