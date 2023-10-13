variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
  sensitive   = true
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare account ID"
}

variable "acearchive_group_emails" {
  type        = list(string)
  description = "Email addresses for the Ace Archive group"
}

variable "nothingradical_group_emails" {
  type        = list(string)
  description = "Email addresses for the Nothing Radical group"
}
