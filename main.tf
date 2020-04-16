locals {
  input_csv = csvdecode(file("${path.root}/${var.csv_name}"))
}

resource "aws_secretsmanager_secret" "example" {
  count                   = length(local.input_csv)
  name                    = local.input_csv[count.index].secretname
  description             = local.input_csv[count.index].comment
  recovery_window_in_days = var.recovery_days
}

resource "aws_secretsmanager_secret_version" "secret" {
  count         = length(local.input_csv)
  secret_id     = aws_secretsmanager_secret.example[count.index].id
  secret_string = local.input_csv[count.index].secretvalue
}
