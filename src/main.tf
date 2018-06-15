provider "aws" {
  region = "us-west-2"
  access_key = "anaccesskey"
  secret_key = "asecretkey"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    s3 = "http://119.18.0.101:4572"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "public-read"
}
