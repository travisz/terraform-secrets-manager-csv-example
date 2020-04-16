# terraform-secrets-manager-csv

Example for mass importing values into Secrets Manager via CSV

## Usage
Create a CSV file in the root of your Terraform with the following format:

```csv
secretname,secretvalue,comment
```

```hcl
module "secretsmanager-import" {
  source        = "git::https://github.com/travisz/terraform-secrets-manager-csv-example?ref=master"
  csv_name      = "path/to/csv"
  recovery_days = "7"
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| csv_name | CSV file to read (relative to root module path) | string | `` | yes |
| recovery_days| Number of days to recover the secret after deletion | number | `` | yes |
