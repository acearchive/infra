resource "cloudflare_ruleset" "rate_limiting" {
  zone_id = data.cloudflare_zone.acearchive.id
  name = "Rate-Limiting"
  kind = "zone"
  phase = "http_ratelimit"

  rules {
    action = "block"

    ratelimit {
      characteristics = [
        "cf.colo.id",
        "ip.src",
      ]

      period = 10
      requests_per_period = 100
      mitigation_timeout = 10
    }

    expression = "not cf.bot_management.verified_bot"
    description = "API Rate-Limiting"
    enabled = true
  }
}
