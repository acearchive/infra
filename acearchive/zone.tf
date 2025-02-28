data "cloudflare_zone" "acearchive" {
  zone_id = "96c97af5e88b8da95dc0126800acc108"
}

resource "cloudflare_zone_dnssec" "acearchive" {
  zone_id = data.cloudflare_zone.acearchive.id
}

resource "cloudflare_zone_setting" "acearchive_always_use_https" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "automatic_https_rewrites" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_brotli" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "brotli"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_browser_check" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "browser_check"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_early_hints" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "early_hints"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_email_obfuscation" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "email_obfuscation"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_hotlink_protection" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "hotlink_protection"
  value      = "off"
}

resource "cloudflare_zone_setting" "acearchive_http3" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "http3"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_ip_geolocation" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "ip_geolocation"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_ipv6" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "ipv6"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_ssl" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "ssl"
  value      = "strict"
}

resource "cloudflare_zone_setting" "acearchive_security_level" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "security_level"
  value      = "medium"
}

resource "cloudflare_zone_setting" "acearchive_min_tls_version" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "min_tls_version"
  value      = "1.2"
}

resource "cloudflare_zone_setting" "acearchive_tls_1_3" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "tls_1_3"
  value      = "zrt"
}

resource "cloudflare_zone_setting" "acearchive_zero_rtt" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "zero_rtt"
  value      = "on"
}

resource "cloudflare_zone_setting" "acearchive_security_header" {
  zone_id    = data.cloudflare_zone.acearchive.id
  setting_id = "security_header"
  value = jsonencode({
    enabled            = true
    preload            = true
    max_age            = 31536000
    include_subdomains = true
    nosniff            = true
  })
}
