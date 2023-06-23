
# Agendamento
data "archive_file" "agendamentos" {
  type        = "zip"
  source_file = "${local.lambdas_path}/agendamento/index.js"
  output_path = "files/agendamentos-artefact.zip"
}

resource "aws_lambda_function" "agendamentos" {
  function_name = "agendamentos"
  handler       = "index.handler"
  role          = aws_iam_role.dynamo.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.agendamentos.output_path
  source_code_hash = data.archive_file.agendamentos.output_base64sha256

  timeout     = 30
  memory_size = 128

  environment {
    variables = {
      TABLE = aws_dynamodb_table.agendamentos.name
    }
  }
}

resource "aws_lambda_permission" "agendamentos" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.agendamentos.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}


# Guias
data "archive_file" "guias" {
  type        = "zip"
  source_file = "${local.lambdas_path}/guia/index.js"
  output_path = "files/guias-artefact.zip"
}

resource "aws_lambda_function" "guias" {
  function_name = "guias"
  handler       = "index.handler"
  role          = aws_iam_role.dynamo.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.guias.output_path
  source_code_hash = data.archive_file.guias.output_base64sha256

  timeout     = 30
  memory_size = 128

  environment {
    variables = {
      TABLE = aws_dynamodb_table.guias.name
    }
  }
}

resource "aws_lambda_permission" "guias" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.guias.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}


# Avaliacoes
data "archive_file" "avaliacoes" {
  type        = "zip"
  source_file = "${local.lambdas_path}/avaliacao/index.js"
  output_path = "files/avaliacoes-artefact.zip"
}

resource "aws_lambda_function" "avaliacoes" {
  function_name = "avaliacoes"
  handler       = "index.handler"
  role          = aws_iam_role.dynamo.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.avaliacoes.output_path
  source_code_hash = data.archive_file.avaliacoes.output_base64sha256

  timeout     = 30
  memory_size = 128

  environment {
    variables = {
      TABLE = aws_dynamodb_table.avaliacoes.name
    }
  }
}

resource "aws_lambda_permission" "avaliacoes" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.avaliacoes.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}