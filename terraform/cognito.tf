resource "aws_cognito_user_pool" "this" {
  name = var.service_name
  tags = local.common_tags
}

resource "aws_cognito_user_pool_client" "this" {
  name         = var.service_name
  user_pool_id = aws_cognito_user_pool.this.id

  generate_secret                      = false
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["openid"]
  callback_urls                        = ["http://localhost:3000"]
  supported_identity_providers         = ["COGNITO"]
}

resource "aws_cognito_user_pool_domain" "this" {
  domain       = var.service_name
  user_pool_id = aws_cognito_user_pool.this.id
}


resource "aws_cognito_user" "this" {
  user_pool_id          = aws_cognito_user_pool.this.id
  username              = "cloud"
  temporary_password    = "TempPass123!"  # Senha temporária para o usuário
  message_action        = "SUPPRESS"      # Suprime o envio de um e-mail ao usuário com as informações da conta

  depends_on = [
    aws_cognito_user_pool_client.this
  ]
}