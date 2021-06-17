# This terraform code is used to create aws ec2 instance

resource "aws_instance" "my_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "my-first-instance"

  }
}
