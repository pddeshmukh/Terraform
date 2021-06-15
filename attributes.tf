# This terraform code is used to create aws resources and use them as attributes and outputs 

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "my-first-s3-bucket-using-terraform"

}

output "mys3bucket" {
  value = aws_s3_bucket.mys3bucket.bucket_domain_name
}
