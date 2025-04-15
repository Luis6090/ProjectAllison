variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "environment" {
  description = "The environment for the API Gateway"
  type        = string
}

variable "prefix" {
    description = "The prefix for the API Gateway"
    type        = string  
}

variable "lambda_uri" {
  description = "The URI of the Lambda function"
  type        = string  
}