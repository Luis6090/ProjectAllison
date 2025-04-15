output "api_gateway_id" {
    description = "ID do API Gateway"
    value       = aws_api_gateway_rest_api.api_gateway.id  # Corrigido para referenciar corretamente
}

output "api_gateway_root_resource_id" {
    description = "ID do recurso root do API Gateway"
    value       = aws_api_gateway_rest_api.api_gateway.root_resource_id  # Corrigido para referenciar corretamente
}

output "api_gateway_arn" {
    description = "ARN do API Gateway"
    value       = aws_api_gateway_rest_api.api_gateway.execution_arn  # Corrigido para referenciar corretamente
}