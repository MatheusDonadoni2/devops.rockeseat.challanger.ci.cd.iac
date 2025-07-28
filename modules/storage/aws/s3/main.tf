resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket        = var.bucket
  force_destroy = var.force_destroy
  tags          = var.tags
  region        = var.region
}