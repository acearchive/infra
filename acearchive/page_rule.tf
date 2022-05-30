resource "cloudflare_page_rule" "www_forward" {
  zone_id = data.cloudflare_zone.acearchive.id
  target = "www.acearchive.lgbt/*"
  priority = 1

  actions {
    forwarding_url {
      url = "https://acearchive.lgbt/$1"
      status_code = 301
    }
  }
}
