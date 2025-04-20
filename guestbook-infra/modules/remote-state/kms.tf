resource "aws_kms_key" "terraform-bucket-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  key_usage               = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "key-alias" {
  name          = "alias/tf-state-bucket-key"
  target_key_id = aws_kms_key.terraform-bucket-key.key_id
}
