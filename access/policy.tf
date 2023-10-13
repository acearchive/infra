resource "cloudflare_access_policy" "acearchive_allow_team" {
  application_id = cloudflare_access_application.acearchive.id
  account_id     = var.cloudflare_account_id
  name           = "Allow Ace Archive Team"
  decision       = "allow"
  precedence     = 1

  include {
    group = [cloudflare_access_group.acearchive.id]
  }
}

resource "cloudflare_access_policy" "hha_allow_team" {
  application_id = cloudflare_access_application.hha.id
  account_id     = var.cloudflare_account_id
  name           = "Allow Ace Archive Team"
  decision       = "allow"
  precedence     = 1

  include {
    group = [cloudflare_access_group.acearchive.id]
  }
}

resource "cloudflare_access_policy" "nothingradical_allow_team" {
  application_id = cloudflare_access_application.nothingradical.id
  account_id     = var.cloudflare_account_id
  name           = "Allow Nothing Radical Team"
  decision       = "allow"
  precedence     = 1

  include {
    group = [cloudflare_access_group.nothingradical.id]
  }
}
