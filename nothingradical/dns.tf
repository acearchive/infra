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

resource "cloudflare_record" "apex_mx" {
  for_each = {
    route1 = {
      value = "route1.mx.cloudflare.net"
      priority = 44
    }
    route2 = {
      value = "route2.mx.cloudflare.net"
      priority = 63
    }
    route3 = {
      value = "route3.mx.cloudflare.net"
      priority = 28
    }
  }

  zone_id = data.cloudflare_zone.nothingradical.id
  type = "MX"
  name = "@"
  value = each.value.value
  priority = each.value.priority
  proxied = false
}

resource "cloudflare_record" "apex_txt_spf" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "TXT"
  name = "@"
  value = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  proxied = false
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "TXT"
  name = "_dmarc"
  value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s;"
  proxied = false
}

resource "cloudflare_record" "txt_domainkey" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type = "TXT"
  name = "*._domainkey"
  value = "v=DKIM1; p="
  proxied = false
}
