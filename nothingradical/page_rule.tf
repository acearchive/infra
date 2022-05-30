resource "cloudflare_page_rule" "www_forward" {
  zone_id = data.cloudflare_zone.nothingradical.id
  target = "www.nothingradical.blog/*"
  priority = 1

  actions {
    forwarding_url {
      url = "https://nothingradical.blog/$1"
      status_code = 301
    }
  }
}
