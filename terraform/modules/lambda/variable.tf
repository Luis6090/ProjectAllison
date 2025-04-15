variable "iam_role_arn" {}

variable "environment" {
  type        = string
  description = "Sigla do ambiente (dev, qa, prod) para uso nos recursos, setado via variável de ambiente do pipeline (não informar no tfvar)"
}

variable "repo_name" {
  type    = string
}

variable "api_gateway_name" {
  type    = string
}

variable "task_timeout" {

  type        = number
  default = 60
  description = "Timeout (in seconds) for wait the task to complete"
}

variable "memory_size" {

  type        = number
  default = 512
  description = "Amount of memory (in MB) available for the lambda to use"
}

variable "environment_variables" {
  type    = list(map(string))
  default = []
}

variable "aws_ecr_repository" {
  type        = string
  description = "ECR repository name"  
}

variable "build_id" {
  type        = string
  description = "Build ID for the image"  
  default = "latest"
}

variable "api_gateway_arn" {
  description = "Execution ARN of the API Gateway"
  type        = string
}