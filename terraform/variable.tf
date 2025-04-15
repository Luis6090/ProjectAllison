variable "environment" {
  type        = string
  description = "Sigla do ambiente (dev, qa, prod) para uso nos recursos, setado via variável de ambiente do pipeline (não informar no tfvar)"
}

variable "repo_name" {
  type    = string
  description = "Nome do repositório Git, setado via variável de ambiente do pipeline (não informar no tfvar)"
}

variable "build_id" {
  description = "ID do build do Azure Devops, setado via variável de ambiente do pipeline (não informar no tfvar)"
}

variable "api_gateway_name" {
  description = "Nome do API Gateway onde será feita a integração."
}


variable "environment_variables" {
  type    = list(map(string))
  default = []
}

variable "prefix" {
  description = "Prefixo para os recursos"
  type        = string  
}

variable "aws_ecr_repository" {
  type        = string
  description = "ECR repository name"
}