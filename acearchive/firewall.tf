# I'm having an issue similar to this when applying this resource:
# https://github.com/cloudflare/terraform-provider-cloudflare/issues/2506

# resource "cloudflare_ruleset" "rate_limiting" {
#   zone_id = data.cloudflare_zone.acearchive.id
#   name = "rate_limiting"
#   kind = "zone"
#   phase = "http_ratelimit"
#
#   rules {
#     action = "block"
#
#     ratelimit {
#       characteristics = [
#         "cf.colo.id",
#         "ip.src",
#       ]
#
#       period = 10
#       requests_per_period = 50
#       mitigation_timeout = 10
#     }
#
#     action_parameters {
#       response {
#         # The Content-Type here *should* be `application/problem+json`, but
#         # Cloudflare only allows a small subset of media types for error
#         # response pages.
#         content_type = "application/json"
#         status_code = 429
#         content = jsonencode(local.rate_limit_response_body)
#       }
#     }
#
#     expression = "not cf.bot_management.verified_bot"
#     description = "Rate-Limiting"
#     enabled = false
#   }
# }
#
# locals {
#   # The API returns `application/problem+json` response objects for errors. This
#   # error is being returned by the CDN, but we still want it to follow the same
#   # schema.
#   rate_limit_response_body = {
#     type = "/problems/too-many-requests"
#     title = "Too Many Requests"
#     status = 429
#     detail = "You are being temporarily rate-limited."
#   }
# }
