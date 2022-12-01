resource "cloudflare_ruleset" "rate_limiting" {
  zone_id = data.cloudflare_zone.acearchive.id
  name = "rate_limiting"
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
      requests_per_period = 20
      mitigation_timeout = 10
    }

    action_parameters {
      response {
        status_code = 429
        content_type = "application/json"
        content = jsonencode(local.rate_limit_response_body)
      }
    }

    expression = "not cf.bot_management.verified_bot"
    description = "Rate-Limiting"
    enabled = true
  }
}

locals {
  rate_limit_response_body = {
    type = "/problems/too-many-requests"
    title = "Too Many Requests"
    status = 429
    detail = "You are being temporarily rate-limited."
  }
}
