resource "cloudflare_web3_hostname" "files" {
  name = "files.acearchive.lgbt"
  description = "Artifact files"
  dnslink = "/ipns/${var.artifact_files_root_ipns}"
  target = "ipfs"
  zone_id = data.cloudflare_zone.acearchive.id
}
