variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
  sensitive   = true
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare account ID"
}

variable "r2_access_key_id" {
  type        = string
  description = "Cloudflare R2 Access Key ID"
  sensitive   = true
}

variable "r2_secret_access_key" {
  type        = string
  description = "Cloudflare R2 Secret Access Key"
  sensitive   = true
}

variable "cloudflare_access_emails" {
  type        = list(string)
  description = "Cloudflare Access email list"
}
