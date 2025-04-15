##########################################################################
#--------------------------- Modules ------------------------------------#
##########################################################################

module "iam" {
  source = "./modules/iam"
  service = var.repo_name
}

module "lambda" {
  source             = "./modules/lambda"
  repo_name          = var.repo_name
  iam_role_arn       = module.iam.role_arn
  memory_size        = 512
  task_timeout       = 30
  aws_ecr_repository = var.aws_ecr_repository
  build_id           = var.build_id
  environment_variables = var.environment_variables
  api_gateway_arn    = module.gateway_rest.api_gateway_arn
  environment       = var.environment
  api_gateway_name = var.api_gateway_name
}

module "gateway_rest" {
  source = "./modules/api_gateway"
  api_gateway_name = "emotion"
  environment = var.environment  
  prefix = var.prefix
  lambda_uri = module.lambda.lambda_uri
}

