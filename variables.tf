variable "vpn_ip" {
  default     = "192.168.1.50/32"
  description = "vpn ip address"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "AWS EC2 instance type"
}

variable "ami_id" {
  default     = "ami-063d4ab14480ac177"
  type        = string
  description = "AMI id to launch EC2 instance"
}

variable "elb_name" {
  type        = string
  default     = null
  description = "Name of the elastic load balancer"
}

variable "azs" {
  type        = list(any)
  default     = null
  description = "availability zones in eu-west-1"
}

variable "timeout" {
  type        = number
  default     = null
  description = "connection draining timeout of load balancer"
}
