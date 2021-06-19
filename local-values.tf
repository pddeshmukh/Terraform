locals {
  common_tags = {
    Owner   = "DevOps Team"
    service = "frontend"
  }
}

resource "aws_instance" "my_local_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = local.common_tags
}

resource "aws_ebs_volume" "my_ebs_volume" {
  availability_zone = var.azs[0]
  size              = 8
  tags              = local.common_tags
}
