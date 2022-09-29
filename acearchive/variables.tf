variable "cloudflare_api_token" {
  type = string
  description = "Cloudflare API token"
  sensitive = true
}

variable "cloudflare_account_id" {
  type = string
  description = "Cloudflare account ID"
}

variable "artifact_files_root_ipns" {
  type = string
  description = "The IPNS name for the root of the artifact file DAG"
}
