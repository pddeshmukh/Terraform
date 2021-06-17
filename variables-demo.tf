resource "aws_security_group" "variable_demo" {
  name        = "variable_demo"
  description = "Creating first variable in terraform "

  ingress {
    description      = "Allow https port"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.vpn_ip]
  }

  ingress {
    description      = "Allow http port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpn_ip]
  }

  ingress {
    description      = "Allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpn_ip]
  }


  tags = {
    Name = "variable_demo"
  }
}
