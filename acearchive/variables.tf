variable "cloudflare_api_token" {
  type = string
  description = "Cloudflare API token"
  sensitive = true
}

variable "cloudflare_account_id" {
  type = string
  description = "Cloudflare account ID"
}

variable "r2_access_key_id" {
  type = string
  description = "Cloudflare R2 Access Key ID"
}

variable "r2_secret_access_key" {
  type = string
  description = "Cloudflare R2 Secret Access Key"
}

variable "artifact_files_root_ipns" {
  type = string
  description = "The IPNS name for the root of the artifact file DAG"
}
