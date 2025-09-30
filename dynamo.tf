resource "aws_dynamodb_table" "file_uploads" {
  name           = "file-uploads"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  hash_key = "fileId"

  attribute {
    name = "fileId"
    type = "S"
  }

  attribute {
    name = "userId"
    type = "S"
  }

  attribute {
    name = "s3Key"
    type = "S"
  }

  global_secondary_index {
    name            = "UserIdIndex"
    hash_key        = "userId"
    projection_type = "ALL"

    read_capacity  = 5
    write_capacity = 5

  }

  global_secondary_index {
    name            = "S3KeyIndex"
    hash_key        = "s3Key"
    projection_type = "ALL"

    read_capacity  = 5
    write_capacity = 5
  }
}
