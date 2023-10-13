resource "cloudflare_ruleset" "etags" {
  zone_id = data.cloudflare_zone.acearchive.id
  name    = "strong_etags"
  kind    = "zone"
  phase   = "http_request_cache_settings"

  rules {
    action = "set_cache_settings"

    action_parameters {
      respect_strong_etags = true
    }

    expression  = "(http.host in {\"files.acearchive.lgbt\" \"api.acearchive.lgbt\" \"hha.acearchive.lgbt\"})"
    description = "Enable Strong ETags"
    enabled     = true
  }
}
