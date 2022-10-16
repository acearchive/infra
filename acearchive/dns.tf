resource "cloudflare_record" "apex_cname" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "CNAME"
  name = "@"
  value = "acearchive-lgbt.pages.dev"
  proxied = true
}

resource "cloudflare_record" "hha_cname" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "CNAME"
  name = "hha"
  value = "hha-archive.pages.dev"
  proxied = true
}

resource "cloudflare_record" "www_aaaa" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "AAAA"
  name = "www"
  value = "100::"
  proxied = true
}

resource "cloudflare_record" "txt_sl_verification" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "TXT"
  name = "@"
  value = "sl-verification=fxncjuftchgummqcrwzrpmyucobgvg"
  proxied = false
}
