data "cloudflare_zone" "nothingradical" {
  name = "nothingradical.blog"
  account_id = var.cloudflare_account_id
}
