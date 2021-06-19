# Using count parameter of terraform to create multiple resources with ease

variable "elb_user_name" {
  type        = list(any)
  description = "usernames for difference Elastic Load Balancer"
  default     = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer", "preprod-loadbalancer"]
}

resource "aws_iam_user" "elb_users" {
  name  = var.elb_user_name[count.index]
  path  = "/system/"
  count = 4
}

resource "aws_iam_user" "lb_user" {
  name  = "loadbalancer-${count.index}"
  path  = "/system/"
  count = 3
}
