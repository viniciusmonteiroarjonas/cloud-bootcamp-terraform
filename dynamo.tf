// GUIAS

resource "aws_dynamodb_table" "guias" {
  hash_key       = "id"
  name           = "meu-guia-guias"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }

  tags = local.common_tags
}

resource "aws_dynamodb_table_item" "guias" {
  table_name = aws_dynamodb_table.guias.name
  hash_key   = aws_dynamodb_table.guias.hash_key

  item = <<ITEM
{
  "id": {"S": "1"},
  "nome": {"S": "Marcos Paulo"},
  "email": {"S": "marcos@gmail.com"},
  "estado": {"S": "SP"}
}
ITEM
}

// AGENDAMENTOS

resource "aws_dynamodb_table" "agendamentos" {
  hash_key       = "id"
  name           = "meu-guia-agendamentos"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }

  tags = local.common_tags
}

resource "aws_dynamodb_table_item" "agendamentos" {
  table_name = aws_dynamodb_table.agendamentos.name
  hash_key   = aws_dynamodb_table.agendamentos.hash_key

  item = <<ITEM
{
  "id": {"S": "1"},
  "data": {"S": "2023-07-07"},
  "guia": {"S": "1"}
}
ITEM
}


// AVALIAÇÃO

resource "aws_dynamodb_table" "avaliacao" {
  hash_key       = "id"
  name           = "meu-guia-avaliacao"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }

  tags = local.common_tags
}

resource "aws_dynamodb_table_item" "avaliacao" {
  table_name = aws_dynamodb_table.avaliacao.name
  hash_key   = aws_dynamodb_table.avaliacao.hash_key

  item = <<ITEM
{
  "id": {"S": "1"},
  "guia": {"S": "1"},
  "avaliacao": {"S": "10"}
}
ITEM
}