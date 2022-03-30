
data "aws_secretsmanager_secret_version" "secret_key_base" {
  secret_id = var.secret_key_base_arn
}
data "aws_secretsmanager_secret_version" "db_user" {
  secret_id = var.db_user_arn
}
data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = var.db_password_arn
}