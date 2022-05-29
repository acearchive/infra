resource "cloudflare_record" "acearchive_apex_cname" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "CNAME"
  name = "@"
  value = "acearchive-lgbt.pages.dev"
  proxied = true
}

resource "cloudflare_record" "acearchive_hha_cname" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "CNAME"
  name = "hha"
  value = "hha-archive.pages.dev"
  proxied = true
}

resource "cloudflare_record" "acearchive_www_aaaa" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "AAAA"
  name = "www"
  value = "100::"
  proxied = true
}
