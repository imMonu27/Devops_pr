//creating backend to migratte state file to aws s3 storage
terraform {
  backend "s3" {
    bucket = "mohit-terraform-bucket-27"
    key = "terraform/PR_1.2/terraform.tfstate"
    region = "us-east-1"
  }
}