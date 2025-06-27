variable "github_organization" {
  type        = string
  description = "Name of the GitHub organization."
}

variable "github_repository" {
  type        = string
  description = "Name of the GitHub repository."
}

variable "tfc_organization" {
  type        = string
  description = "Name of the TFC organization."
}

variable "tfc_project" {
  type        = string
  description = "Name of the TFC project."
}

variable "tfc_workspace_prefix" {
  type        = string
  description = "Name of the TFC workspace."
  default     = "terraform-vault-onboarding"
}

variable "tfc_working_directory_prefix" {
  type        = string
  description = "Working directory for the TFC workspace."
  default     = "terraform-cloud"
}

variable "vault_address" {
  type        = string
  description = "Vault API endpoint"
}

variable "vault_auth_path" {
  type        = string
  description = "Mount path where JWT Auth will be configured"
}

variable "vault_auth_role" {
  type        = string
  description = "Vault role name"
  default     = "tfc-namespace-admin"
}

variable "enable_tfc_agent_pool" {
  type    = bool
  default = true
}

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
