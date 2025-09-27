terraform {
  backend "s3" {
    bucket = "postech-soat10-bucket-fase5"
    key    = "github-actions-fiap/infra-dados/terraform.tfstate"

    region  = var.region
    encrypt = true
  }

  required_version = ">= 1.2.0"

}
