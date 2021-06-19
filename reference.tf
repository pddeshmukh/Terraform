# This code block is for creating ec2 instance and attaching public ip to it.

resource "aws_instance" "my_first_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "my-first-reference-instance"

  }
}

resource "aws_eip" "elastic_ip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my_first_ec2.id
  allocation_id = aws_eip.elastic_ip.id
}

resource "aws_security_group" "my_first_sg" {
  name        = "my_first_sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.elastic_ip.public_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
