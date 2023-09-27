resource "aws_dynamodb_table" "signuptable" {
  name           = "signuptable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5  # Adjust as needed
  write_capacity = 5  # Adjust as needed

  hash_key = "email"

  attribute {
    name = "email"
    type = "S"  # String type
  }

  # If you want to enable point-in-time recovery
  point_in_time_recovery {
    enabled = false  # Change to true if you want to enable it
  }

  # If you want to enable server-side encryption
  server_side_encryption {
    enabled     = false
    # kms_key_arn = aws_kms_key.dynamo.arn
  }
}

# This is needed if you enable server-side encryption
# resource "aws_kms_key" "dynamo" {
#   description = "KMS key for DynamoDB table signuptable"
#   policy      = <<-EOT
#   {
#     "Version": "2012-10-17",
#     "Id": "dynamo",
#     "Statement": [
#       {
#         "Sid": "Enable IAM User Permissions",
#         "Effect": "Allow",
#         "Principal": {"AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"},
#         "Action": "kms:*",
#         "Resource": "*"
#       }
#     ]
#   }
#   EOT
# }

data "aws_caller_identity" "current" {}



