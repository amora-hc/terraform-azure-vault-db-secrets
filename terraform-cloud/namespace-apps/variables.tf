variable "vault_azuresql_secrets_mount" {
  type    = string
  default = "azuresql"
}

variable "vault_azuresql_secrets_connection" {
  type    = string
  default = "my-mssql-database"
}

variable "vault_azuresql_secrets_role" {
  type    = string
  default = "app-role"
}

variable "azuresql_db_server_url" {
  type    = string
  default = "test-server.database.windows.net"
}

variable "azuresql_db_name" {
  type    = string
  default = "test-db"
}

variable "azuresql_db_vault_user" {
  default = "vault"
}

variable "azuresql_db_vault_password" {
  default = "pass"
}
