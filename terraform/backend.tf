terraform {
  backend "s3" {
    bucket         = "assesment_882025"
    key            = "assessment/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dbassesment8825"
    encrypt        = true
  }
}
