resource "aws_s3_bucket" "artifacts" {
  bucket = "acearchive-lgbt-artifacts"
}

resource "aws_s3_bucket" "artifacts_dev" {
  bucket = "acearchive-lgbt-artifacts-dev"
}

resource "aws_s3_bucket" "staging" {
  bucket = "acearchive-lgbt-staging"
}
