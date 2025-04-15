resource "aws_iam_role" "role" {
  name               = "role-lambda-${var.service}"
  description        = "role lambda  execution"
  assume_role_policy = file("./modules/iam/trusted-role.json")
  tags = {
    "ResourceType" = "IAM"
    "ResourceName" = replace(title("role-service-${var.service}"), "-", "")
  }
}

resource "aws_iam_role_policy" "role_policy" {
  name   = "service-policy-${var.service}"
  policy = file("./modules/iam/role-policy.json")
  role   = aws_iam_role.role.id
}

# # Attach VPC Execution Policy to Lambda Role
# resource "aws_iam_policy_attachment" "vpc_access" {
#   name       = "vpc-access-policy"
#   roles      = [aws_iam_role.role.name]
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
# }