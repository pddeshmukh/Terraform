# This terraform code is used to create aws ec2 instance with key pair and install nginx on the newly created instance

resource "aws_instance" "my_ec2_using_key" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "terraform-test"

  tags = {
    Name = "my-first-instance-using-key"

  }


  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform-test.pem")
      host        = self.public_ip
    }
  }
}
