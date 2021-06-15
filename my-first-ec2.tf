provider "aws" {
  region     = "eu-west-1"
  access_key = "AKIA3TKN5EEUYLB26EEF"
  secret_key = "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"
}


resource "aws_instance" "my_ec2" {
  ami = "ami-063d4ab14480ac177"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-instance"

  }
}
