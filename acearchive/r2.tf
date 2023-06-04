resource "aws_s3_bucket" "artifacts" {
  bucket = "acearchive-lgbt-artifacts"
}

resource "aws_s3_bucket" "staging" {
  bucket = "acearchive-lgbt-staging"
}
