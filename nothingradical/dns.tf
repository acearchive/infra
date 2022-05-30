resource "cloudflare_record" "apex_cname" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "CNAME"
  name = "@"
  value = "nothingradical-blog.pages.dev"
  proxied = true
}

resource "cloudflare_record" "www_aaaa" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "AAAA"
  name = "www"
  value = "100::"
  proxied = true
}
