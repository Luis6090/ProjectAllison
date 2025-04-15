# Create the Lambda Function
resource "aws_lambda_function" "example" {
  function_name = "${var.repo_name}-lambda"
  role          = var.iam_role_arn
  package_type  = "Image"

  memory_size = var.memory_size
  timeout     = var.task_timeout

  image_uri = "${var.aws_ecr_repository}:${var.build_id}"

  lifecycle {
    create_before_destroy = true
  }

  # Specify environment variables (optional)
  environment {
    variables = { for item in var.environment_variables : item.name => item.value }
  }
}

resource "aws_lambda_permission" "allow_api_gateway_to_invoke_lambda" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example.function_name
  principal     = "apigateway.amazonaws.com"
  
  # Permite que o API Gateway de qualquer conta invoque a Lambda
  source_arn = "${var.api_gateway_arn}/*/*"
}

#Invocação para ativar e "esquentar" a lambda
#Isto visa melhorar os tempos de resposta nas primeiras requisições após o deploy
resource  "aws_lambda_invocation" "example" {
  function_name = aws_lambda_function.example.function_name
 
  input = jsonencode({
    body = "{\"message\":\"o que foi a revolucao francesa?\"}"
  })
 
  triggers = {
    redeployment = timestamp()  
  } 
}