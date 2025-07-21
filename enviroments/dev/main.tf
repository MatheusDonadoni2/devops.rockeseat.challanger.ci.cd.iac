module "aws_s3_bucket_backend" {
  source        = "../../modules/storage/s3"
  bucket        = "${var.service_name}.terraform.state"
  force_destroy = true
  region        =  var.aws_region
}