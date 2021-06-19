#This specific code block is used to understand the zipmap functon in terraform

resource "aws_iam_user" "zipmap_iam" {
  name  = "myiamuser.${count.index}"
  count = 3
  path  = "/system/"

}

#output in the using zipmap function

output "combined" {
  value = zipmap(aws_iam_user.zipmap_iam[*].name, aws_iam_user.zipmap_iam[*].arn)
}
