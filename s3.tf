resource "random_string" "random" {
  length  = 5
  upper   = false
  special = false
}


resource "aws_s3_bucket" "mys3" {
  bucket = "${var.prefix}-s3-${random_string.random.id}"

  tags = {
    Environment =  var.env
    Project     = var.project
  }
}