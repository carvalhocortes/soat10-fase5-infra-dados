resource "aws_dynamodb_table" "files" {
  name         = "files"
  billing_mode = "PROVISIONED"

  read_capacity  = 5
  write_capacity = 5

  hash_key  = "email"
  range_key = "fileName"
  attribute {
    name = "email"
    type = "S"
  }
  attribute {
    name = "fileName"
    type = "S"
  }
}
