resource "cloudflare_page_rule" "acearchive_www_forward" {
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

resource "cloudflare_page_rule" "nothingradical_www_forward" {
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
