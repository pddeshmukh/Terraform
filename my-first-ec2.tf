# This terraform code is used to create aws ec2 instance

resource "aws_instance" "my_ec2" {
  ami = "ami-063d4ab14480ac177"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-instance"

  }
}
