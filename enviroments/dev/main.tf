##bucket
module "terraform_backend" {
  source        = "../../modules/storage/aws/s3"
  bucket        = "bucket.terraform.state"
  force_destroy = true
  region        = var.aws_region
  tags = {
    "IAC" = "True"
  }
}

#container registry
module "container_registry" {
  source = "../../modules/container.registry/aws/ecr"
  name = "${var.service_name}.container.registry.${var.enviroment}"
  tags = {
    "IAC" = "True"
  }  
}