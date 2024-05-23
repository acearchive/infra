resource "cloudflare_ruleset" "www_forward" {
  zone_id     = data.cloudflare_zone.acearchive.id
  name        = "Redirect www"
  description = "Redirect www subdomain requests"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    action = "redirect"

    action_parameters {
      from_value {
        status_code = 301

        target_url {
          expression = "concat(\"https://acearchive.lgbt\", http.request.uri.path)"
        }
      }
    }

    expression  = "(http.host == \"www.acearchive.lgbt\")"
    description = "Redirect visitors to the apex domain"
    enabled     = true
  }
}
