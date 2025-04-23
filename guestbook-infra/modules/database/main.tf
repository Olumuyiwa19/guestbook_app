
resource "aws_db_subnet_group" "rds" {
  name       = "${var.app_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "db_instance" {
  identifier                          = "${var.app_name}-${var.environment}-db"
  db_name                             = "${var.app_name}_${var.environment}_db"
  engine                              = var.db_engine
  engine_version                      = var.db_engine_version
  instance_class                      = var.db_instance_class
  allocated_storage                   = var.db_allocated_storage
  username                            = var.db_username
  password                            = var.db_password
  port                                = var.db_port
  db_subnet_group_name                = aws_db_subnet_group.rds.name
  vpc_security_group_ids              = [var.security_group_id]
  kms_key_id                          = aws_kms_key.rds_encryption_key.arn
  apply_immediately                   = true
  backup_retention_period             = 7
  iam_database_authentication_enabled = true
  multi_az                            = true
  publicly_accessible                 = false
  skip_final_snapshot                 = true
  storage_encrypted                   = true
}
