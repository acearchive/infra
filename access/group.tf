resource "cloudflare_access_group" "acearchive" {
  account_id = var.cloudflare_account_id
  name       = "Ace Archive Team"

  include {
    email = var.acearchive_group_emails
  }
}

resource "cloudflare_access_group" "nothingradical" {
  account_id = var.cloudflare_account_id
  name       = "Nothing Radical Team"

  include {
    email = var.nothingradical_group_emails
  }
}
