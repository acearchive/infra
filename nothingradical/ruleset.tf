resource "cloudflare_ruleset" "feed_uri" {
  zone_id = data.cloudflare_zone.nothingradical.id
  name = "Rewrite Atom feed URI"
  description = "Rewrite Atom feed URI"
  kind = "zone"
  phase = "http_request_transform"

  rules {
    action = "rewrite"
    action_parameters {
      uri {
        path {
          value = "/feed.xml"
        }
      }
    }

    description = "Rewrite Atom feed URI"
    expression = "(http.request.uri.path eq \"/feed\") or (http.request.uri.path eq \"/feed/\")"
    enabled = true
  }
}
