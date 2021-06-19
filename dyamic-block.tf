#Usage of Dynamic block in terraform to create security groups with multipls ingress

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8000, 8100, 9200, 9500]
}

resource "aws_security_group" "my_security_group" {
  name        = "dynamic-sg"
  description = "Ingress SG created using dynamic block of terraform"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
