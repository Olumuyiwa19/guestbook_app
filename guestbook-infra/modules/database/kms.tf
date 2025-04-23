resource "aws_kms_key" "rds_encryption_key" {
  description             = "This key is used to encrypt rds instance"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  key_usage               = "ENCRYPT_DECRYPT"

  tags = {
    Name = "${var.app_name}-${var.environment}-rds-kms-key"
  }
}

resource "aws_kms_alias" "key_alias" {
  name          = var.key_alias
  target_key_id = aws_kms_key.rds_encryption_key.key_id
}
