resource "aws_kms_key" "terraform-bucket-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  key_usage               = "ENCRYPT_DECRYPT"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_kms_alias" "key-alias" {
  name          = var.key_alias
  target_key_id = aws_kms_key.terraform-bucket-key.key_id
}
