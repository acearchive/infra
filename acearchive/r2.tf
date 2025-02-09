resource "aws_s3_bucket" "artifacts" {
  bucket = "acearchive-lgbt-artifacts"
}

resource "aws_s3_bucket" "artifacts_dev" {
  bucket = "acearchive-lgbt-artifacts-dev"
}

resource "aws_s3_bucket" "db_backups" {
  bucket = "acearchive-lgbt-db-backups"
}

resource "aws_s3_bucket" "db_backups_dev" {
  bucket = "acearchive-lgbt-db-backups-dev"
}

# The purpose of this bucket is to give us (me) a place to manually upload files
# that don't have a direct-download link on the web. For example, if I write a
# transcript, I can upload it to this bucket using the Cloudflare dashboard and
# use that URL in the artifact submission. This bucket is configured to be
# publicly accessible.
resource "aws_s3_bucket" "staging" {
  bucket = "acearchive-lgbt-staging"
}
