output "files_table_arn" {
  description = "ARN da tabela de Arquivos"
  value       = aws_dynamodb_table.files.arn
}
