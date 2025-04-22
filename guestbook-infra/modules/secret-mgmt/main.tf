resource "random_password" "db_pass" {
  length           = 16
  override_special = "@#%&*"
}

resource "aws_secretsmanager_secret" "db_password" {
  name                    = "/${var.app_name}-${var.environment}/db-creds"
  recovery_window_in_days = 7
  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = random_password.db_pass.result
}
