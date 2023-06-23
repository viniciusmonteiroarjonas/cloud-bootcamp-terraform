output "cognito_pool_id" {
  value = aws_cognito_user_pool.this.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.this.id
}

output "cognito_url" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.${var.aws_region}.amazoncognito.com"
}

output "cognito_user" {
  value = aws_cognito_user.this.username
}

output "api_url" {
  value = aws_api_gateway_deployment.this.invoke_url
}

output "lambda_dynamo_agendamento_url" {
  value = aws_lambda_function.agendamentos.invoke_arn
}

output "lambda_dynamo_guia_url" {
  value = aws_lambda_function.guias.invoke_arn
}

output "lambda_dynamo_avaliacoes_url" {
  value = aws_lambda_function.avaliacoes.invoke_arn
}
