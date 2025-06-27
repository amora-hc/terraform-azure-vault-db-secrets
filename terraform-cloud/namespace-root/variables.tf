variable "vault_db_secrets_mount" {
  type        = string
  default     = "azuresql"
}

variable "vault_db_secrets_connection" {
  type        = string
  default     = "my-mssql-database"
}

variable "vault_db_secrets_role" {
  type        = string
  default     = "app-role"
}

variable "db_server_url" {
  type        = string
  default     = "test-server.database.windows.net"
}

variable "db_name" {
  type        = string
  default     = "test-db"
}

variable "db_vault_user" {
  default = "vault"
}

variable "db_vault_password" {
  default = "pass"
}
