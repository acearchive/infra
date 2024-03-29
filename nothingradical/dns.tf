resource "cloudflare_record" "apex_cname" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type    = "CNAME"
  name    = "@"
  value   = "nothingradical-blog.pages.dev"
  proxied = true
}

resource "cloudflare_record" "www_aaaa" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type    = "AAAA"
  name    = "www"
  value   = "100::"
  proxied = true
}

resource "cloudflare_record" "apex_txt_sl_verification" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type    = "TXT"
  name    = "@"
  value   = "sl-verification=dqngxzimfmudfnhwdhaubcjzgiqlve"
  proxied = false
}

resource "cloudflare_record" "apex_mx" {
  for_each = {
    route1 = {
      value    = "mx1.simplelogin.co."
      priority = 10
    }
    route2 = {
      value    = "mx2.simplelogin.co."
      priority = 20
    }
  }

  zone_id  = data.cloudflare_zone.nothingradical.id
  type     = "MX"
  name     = "@"
  value    = each.value.value
  priority = each.value.priority
  proxied  = false
}

resource "cloudflare_record" "apex_txt_spf" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 include:simplelogin.co ~all"
  proxied = false
}

resource "cloudflare_record" "apex_cname_dkim" {
  for_each = {
    record1 = {
      name  = "dkim._domainkey"
      value = "dkim._domainkey.simplelogin.co."
    }

    record2 = {
      name  = "dkim02._domainkey"
      value = "dkim02._domainkey.simplelogin.co."
    }

    record3 = {
      name  = "dkim03._domainkey"
      value = "dkim03._domainkey.simplelogin.co."
    }
  }

  zone_id = data.cloudflare_zone.nothingradical.id
  type    = "CNAME"
  name    = each.value.name
  value   = each.value.value
  proxied = false
}

resource "cloudflare_record" "apex_txt_dmarc" {
  zone_id = data.cloudflare_zone.nothingradical.id
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s"
  proxied = false
}
