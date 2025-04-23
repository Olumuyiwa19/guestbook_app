resource "random_password" "db_pass" {
  length           = 16
  override_special = "@#%&*"
}

resource "aws_secretsmanager_secret" "db_creds" {
  name                    = "/${var.app_name}-${var.environment}/db-credentials"
  recovery_window_in_days = 7
  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db_creds" {
  secret_id = aws_secretsmanager_secret.db_creds.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password != "" ? var.db_password : random_password.db_pass.result
    host     = var.rds_endpoint
    port     = var.db_port
    dbname   = var.db_name
    engine   = var.db_engine
  })
}
