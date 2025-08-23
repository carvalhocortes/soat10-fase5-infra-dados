# Infra de Dados (Terraform) - FIAP SOAT10 Fase 5

Provisionamento de infraestrutura de dados na AWS usando Terraform. Este projeto cria uma tabela DynamoDB chamada `files` e utiliza backend remoto no S3 para armazenar o estado do Terraform.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-purple.svg)](https://www.terraform.io/)

## 📋 Sobre o Projeto

Infraestrutura de dados para a **Fase 5 da Pós-Graduação em Arquitetura de Software da FIAP - Turma SOAT10**, provisionada com Terraform na AWS. Este projeto cria e gerencia uma tabela DynamoDB chamada `files` e utiliza um backend remoto em S3 para armazenar o estado do Terraform com segurança.

## Visão geral

- Provedor: AWS.
- Backend remoto (state): S3 com criptografia habilitada.

Arquivos principais:

- `main.tf`: provedor AWS.
- `backend.tf`: configuração do backend S3 do Terraform.
- `variables.tf`: variáveis de entrada (região e ambiente).
- `dynamo.tf`: definição da tabela DynamoDB.
- `outputs.tf`: saídas do Terraform.
- `terraform.tfvars`: valores padrão para variáveis.
- `dynamo.md`: justificativa técnica para uso do DynamoDB.

### Variáveis de Ambiente

| Variável     | Descrição     | Exemplo     |
| ------------ | ------------- | ----------- |
| `AWS_REGION` | Região da AWS | `us-east-1` |

Você pode ajustar via `terraform.tfvars` ou linha de comando `-var`.

### Recursos provisionados

DynamoDB `files`:

- Billing mode: `PROVISIONED`
- Read capacity: 5
- Write capacity: 5
- Chaves:
  - Partition key (`hash_key`): `email` (String)
  - Sort key (`range_key`): `fileName` (String)

Saídas:

- `files_table_arn`: ARN da tabela `files`.

## 🧠 Decisões e justificativa do DynamoDB

As decisões que levaram à escolha do Amazon DynamoDB para este projeto estão documentadas em detalhe no arquivo [dynamo.md](dynamo.md).

Resumo dos pontos principais:
- Modelo NoSQL flexível para itens com atributos variáveis.
- Baixa latência e alta performance em serviço gerenciado.
- Escalabilidade automática e alta disponibilidade.
- Operação simplificada e custo sob demanda.

Para a análise completa, consulte o documento: [dynamo.md](dynamo.md).

## 🔧 Configuração e Deploy

### Pré-requisitos

- Terraform >= 1.2.0
- Conta AWS e credenciais válidas (via `AWS_PROFILE`, variáveis de ambiente ou arquivo de credenciais)
- Bucket S3 do backend já existente: `postech-soat10-bucket-fase5` na região `us-west-2`
  - Permissões para ler/gravar o objeto `github-actions-fiap/infra-dados/terraform.tfstate`

### Instalação / deploy

1. Inicializar o backend e provedores

```sh
terraform init
```

2. Visualizar o plano

```sh
terraform plan \
  -var "region=us-west-2" \
  -var "environment=Production"
```

3. Aplicar as mudanças

```sh
terraform apply
```

Para execução não interativa:

```sh
terraform apply -auto-approve
```

4. Destruir a infraestrutura (cuidado!)

```sh
terraform destroy
```

Dica: para usar um profile específico da AWS CLI:

```sh
export AWS_PROFILE=seu-perfil
```

## Notas importantes

- O bucket S3 do backend não é criado por este projeto; crie-o previamente ou ajuste `backend.tf` conforme seu ambiente.
- Custos: a tabela está em modo provisionado (5/5). Ajuste capacidades ou considere autoscaling/on-demand conforme necessidade e custo.
- Segurança: não faça commit de segredos. Use perfis/variáveis de ambiente seguros.

## 👥 Equipe

### Turma:

SOAT10 - FIAP Pós-Graduação em Arquitetura de Software

### Desenvolvedores:

- Fernando Carvalho de Paula Cortes - rm360486
- Samuel Victor Santos - rm360487

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**Desenvolvido com ❤️ para a FIAP SOAT10 - Fase 5**
