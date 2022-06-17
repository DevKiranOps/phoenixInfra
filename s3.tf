resource "random_string" "random" {
  length  = 5
  upper   = false
  special = false
}


resource "aws_s3_bucket" "mys3" {
  bucket = "phoenix-s3-${random_string.random.id}"

  tags = {
    Environment = "Test"
    Project     = "phoenix"
  }
}