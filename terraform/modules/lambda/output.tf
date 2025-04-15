output "lambda_function_arn" {
  value = aws_lambda_function.example.arn  # Corrigido de lambda_function para example
}

output "lambda_uri" {
  value = aws_lambda_function.example.invoke_arn  # Corrigido de lambda_function para example
}
