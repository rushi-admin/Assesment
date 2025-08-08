terraform {
  backend "s3" {
    bucket         = "CHANGE_ME_TFSTATE_BUCKET"
    key            = "assessment/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "CHANGE_ME_DYNAMODB_TABLE"
    encrypt        = true
  }
}
