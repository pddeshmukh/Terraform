#Create resources by specfying particular conditions


variable "check_condition" {

}

# This resource block will check if the condition is "true" by reffering the terraform.tfvars file and execute as per the count
resource "aws_instance" "dev_instance" {
  ami = var.ami_id
  instance_type = "t2.micro"
  count = var.check_condition == true ? 1 : 0
  tags = {
    Name = "my-first-dev-instance"

  }
}

# This resource block will check if the condition is "false" by reffering the terraform.tfvars file and execute as per the count
resource "aws_instance" "prod_instance" {
  ami = var.ami_id
  instance_type = "t2.large"
  count = var.check_condition == false ? 1 : 0
  tags = {
    Name = "my-first-prod-instance"

  }
}
