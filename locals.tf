locals {
  # lambdas_path = "${path.module}/lambdas"
  # layers_path  = "${path.module}/../app/layers/nodejs"
  
  common_tags = {
    Project   = "Meu guia"
    CreatedAt = "2023-06-22"
    ManagedBy = "Terraform"
    Owner     = "Grupo Meu Guia"
    Service   = var.service_name
  }
}