# modules/api_gateway/main.tf

resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = var.api_gateway_name
  description = "API Gateway for ${var.api_gateway_name} in ${var.environment} environment"
  api_key_source = "HEADER"
  
  endpoint_configuration {
    types = ["EDGE"]
  }
}

resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "emotion"
}

resource "aws_api_gateway_method" "api_gateway_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.api_gateway_resource.id
  http_method   = "POST"  # Pode ser GET, POST ou outro dependendo da necessidade
  authorization = "NONE"
}

# Definir a integração entre o método API Gateway e a função Lambda
resource "aws_api_gateway_integration" "integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.api_gateway_resource.id  # Corrigido de 'resource.id' para 'api_gateway_resource.id'
  http_method = aws_api_gateway_method.api_gateway_method.http_method  # Corrigido de 'method.http_method' para 'api_gateway_method.http_method'
  integration_http_method = "POST"
  type        = "AWS_PROXY"
  uri         = var.lambda_uri  # Corrigido de 'aws_lambda_function.example.invoke_arn' para 'var.lambda_uri'
}
