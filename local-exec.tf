# This terraform code is used to create aws ec2 instance and use local-exec to pass the private ip of the instance to a file on local

resource "aws_instance" "my_local-exec_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "my-first-local-instance"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
