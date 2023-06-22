
# Agendamento
data "archive_file" "dynamo_agendamento" {
  type        = "zip"
  source_file = "${local.lambdas_path}/agendamento/index.js"
  output_path = "files/dynamo_agendamento-artefact.zip"
}

resource "aws_lambda_function" "dynamo_agendamento" {
  function_name = "dynamo_agendamento"
  handler       = "index.handler"
  role          = aws_iam_role.dynamo.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.dynamo_agendamento.output_path
  source_code_hash = data.archive_file.dynamo_agendamento.output_base64sha256

  timeout     = 30
  memory_size = 128

  environment {
    variables = {
      TABLE = aws_dynamodb_table.agendamentos.name
    }
  }
}

resource "aws_lambda_permission" "dynamo_agendamento" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.dynamo_agendamento.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}


# Guias
data "archive_file" "dynamo_guias" {
  type        = "zip"
  source_file = "${local.lambdas_path}/guia/index.js"
  output_path = "files/dynamo_guias-artefact.zip"
}

resource "aws_lambda_function" "dynamo_guias" {
  function_name = "dynamo_guias"
  handler       = "index.handler"
  role          = aws_iam_role.dynamo.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.dynamo_guias.output_path
  source_code_hash = data.archive_file.dynamo_guias.output_base64sha256

  timeout     = 30
  memory_size = 128

  environment {
    variables = {
      TABLE = aws_dynamodb_table.guias.name
    }
  }
}

resource "aws_lambda_permission" "dynamo_guias" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.dynamo_guias.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}


# Avaliacoes
data "archive_file" "dynamo_avaliacoes" {
  type        = "zip"
  source_file = "${local.lambdas_path}/avaliacao/index.js"
  output_path = "files/dynamo_avaliacoes-artefact.zip"
}

resource "aws_lambda_function" "dynamo_avaliacoes" {
  function_name = "dynamo_avaliacoes"
  handler       = "index.handler"
  role          = aws_iam_role.dynamo.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.dynamo_avaliacoes.output_path
  source_code_hash = data.archive_file.dynamo_avaliacoes.output_base64sha256

  timeout     = 30
  memory_size = 128

  environment {
    variables = {
      TABLE = aws_dynamodb_table.avaliacoes.name
    }
  }
}

resource "aws_lambda_permission" "dynamo_avaliacoes" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.dynamo_avaliacoes.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}