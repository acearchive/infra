data "cloudflare_zone" "acearchive" {
  name = "acearchive.lgbt"
  account_id = var.cloudflare_account_id
}

data "cloudflare_zone" "nothingradical" {
  name = "nothingradical.blog"
  account_id = var.cloudflare_account_id
}
