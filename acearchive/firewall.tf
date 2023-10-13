locals {
  # The API returns `application/problem+json` response objects for errors. This
  # error is being returned by the CDN, but we still want it to follow the same
  # schema.
  rate_limit_response_body = {
    type   = "/problems/too-many-requests"
    title  = "Too Many Requests"
    status = 429
    detail = "You are being temporarily rate-limited."
  }
}

resource "cloudflare_rate_limit" "acearchive_api" {
  zone_id     = data.cloudflare_zone.acearchive.id
  threshold   = 200
  period      = 1
  disabled    = true
  description = "Rate limit for API"

  match {
    request {
      url_pattern = "api.${data.cloudflare_zone.acearchive.name}/*"
      schemes     = ["_ALL_"]
      methods     = ["_ALL_"]
    }
  }

  action {
    mode    = "simulate"
    timeout = 10

    response {
      # The Content-Type here *should* be `application/problem+json`, but
      # Cloudflare only allows a small subset of media types for error response
      # pages.
      content_type = "application/json"
      body         = jsonencode(local.rate_limit_response_body)
    }
  }
}
