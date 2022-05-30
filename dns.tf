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

resource "cloudflare_record" "acearchive_apex_mx" {
  for_each = {
    route1 = {
      value = "route1.mx.cloudflare.net"
      priority = 85
    }
    route2 = {
      value = "route2.mx.cloudflare.net"
      priority = 93
    }
    route3 = {
      value = "route3.mx.cloudflare.net"
      priority = 87
    }
  }

  zone_id = data.cloudflare_zone.acearchive.id
  type = "MX"
  name = "@"
  value = each.value.value
  priority = each.value.priority
  proxied = false
}

resource "cloudflare_record" "acearchive_apex_txt_spf" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "TXT"
  name = "@"
  value = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  proxied = false
}

resource "cloudflare_record" "acearchive_txt_dmark" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "TXT"
  name = "_dmarc"
  value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s;"
  proxied = false
}

resource "cloudflare_record" "acearchive_txt_domainkey" {
  zone_id = data.cloudflare_zone.acearchive.id
  type = "TXT"
  name = "*._domainkey"
  value = "v=DKIM1; p="
  proxied = false
}

resource "cloudflare_record" "nothingradical_apex_cname" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "CNAME"
  name = "@"
  value = "nothingradical-blog.pages.dev"
  proxied = true
}

resource "cloudflare_record" "nothingradical_www_aaaa" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "AAAA"
  name = "www"
  value = "100::"
  proxied = true
}
