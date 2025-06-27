# OPTIONAL: Read MSSQL Vault user credentials from KV
#data "vault_kv_secret_v2" "mssql_vaultuser" {
#  mount = "secret"
#  name  = "mssql/vaultuser-creds"
#}

# Enable a database secrets engine mount
resource "vault_database_secrets_mount" "db" { ##azuresql
  path = var.vault_azuresql_secrets_mount
}

# Configure the MSSQL connection using the read credentials
resource "vault_database_secret_backend_connection" "mssql" {
  backend       = vault_database_secrets_mount.db.path
  name          = var.vault_azuresql_secrets_connection
  plugin_name   = "mssql-database-plugin"
  allowed_roles = [vault_database_secret_backend_role.mssql.name]

  mssql {
    connection_url = <<-EOT
      server=${var.azuresql_db_server_url};
      port=1433;
      user id=${var.azuresql_db_vault_user};
      password=${var.azuresql_db_vault_password};
      database=${var.azuresql_db_name};
      app name=vault;
    EOT
    contained_db   = true
  }
}

# Configure a role to be used by the MSSQL connection
resource "vault_database_secret_backend_role" "mssql" {
  name    = var.vault_azuresql_secrets_role
  backend = vault_database_secrets_mount.db.path
  db_name = var.vault_azuresql_secrets_connection

  creation_statements = [
    "CREATE USER [{{name}}] WITH PASSWORD = '{{password}}';",
    "GRANT SELECT ON SCHEMA::dbo TO [{{name}}];"
  ]

  revocation_statements = [
    "DROP USER IF EXISTS [{{name}}];"
  ]
}
