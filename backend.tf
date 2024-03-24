# terraform {
#   backend "s3" {
#     bucket         = "s3-bucket-name"
#     key            = "state/terraform.tfstate"
#     region         = "us-east-2"
#     encrypt        = true
#     dynamodb_table = "DynamoDB table"
#   }
# }  