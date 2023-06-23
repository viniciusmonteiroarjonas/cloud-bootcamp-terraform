## Desenho solução

<img src="arquivos/desenho-solucao.jpeg">


## Como validar implementação

1) Criar toda infra na AWS com o código terraform
2) Acessar o console da AWS e criar um usuário Cognito


### Recursos criado na AWS
1. Cognito
2. Bucket
3. Dynamo

### Lista de comandos terraform

Configuração inicial do terraform
```
terraform init
```

Criar plano de criação
```
terraform plan
```

Criar recursos na AWS
```
terrafom apply --auto-approve
```

Destruir recursos na AWS
```
terraform destroy
```
