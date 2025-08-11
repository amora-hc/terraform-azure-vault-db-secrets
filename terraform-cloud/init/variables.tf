variable "github_organization" {
  type        = string
  description = "Name of the GitHub organization."
  default     = "MyOrg"
}

variable "github_repository" {
  type        = string
  description = "Name of the GitHub repository."
  default     = "terraform-vault-onboarding"
}

variable "github_oauth_token" {
  type        = string
  description = "Github apps personal access token"
  default     = "ghp_AAAAAAAAAAAAAAAABBBBBBBCCCCCDD"
}

variable "tfc_organization" {
  type        = string
  description = "Name of the TFC organization."
  default     = "MyOrg"
}

variable "tfc_project" {
  type        = string
  description = "Name of the TFC project."
  default     = "default project"
}

variable "tfc_workspace_prefix" {
  type        = string
  description = "Name of the TFC workspace."
  default     = "mutua-vault-db"
}

variable "tfc_working_directory_prefix" {
  type        = string
  description = "Working directory for the TFC workspace."
  default     = "terraform-cloud"
}

variable "tfc_token" {
  type        = string
  description = "Terraform Cloud API token"
  default     = "L9IwGVXFTAbfzD.atlasv1.AAAAAAAAAAAAAAAABBBBBBB"
}

variable "default_lease_ttl" {
  type        = string
  description = "Default lease TTL for Vault tokens"
  default     = "10m"
}

variable "max_lease_ttl" {
  type        = string
  description = "Maximum lease TTL for Vault tokens"
  default     = "30m"
}

variable "token_type" {
  type        = string
  description = "Token type for Vault tokens"
  default     = "default-service"
}

variable "vault_auth_path" {
  type        = string
  description = "Mount path where JWT Auth will be configured"
  default     = "jwt/tfc"
}

variable "vault_address" {
  type        = string
  description = "Vault API endpoint"
  default     = "https://127.0.0.1:8200"
}

variable "vault_address_tfc_agent" {
  type        = string
  description = "Vault API endpoint for TFC agent"
  default     = "https://127.0.0.1:8200"
}

variable "vault_auth_role_prefix" {
  type        = string
  description = "Vault role name"
  default     = "tfc-admin"
}

variable "vault_policy" {
  type        = string
  description = "Vault policy name"
  default     = "tfc-admin"
}

variable "enable_tfc_agent_pool" {
  type    = bool
  default = false
}

variable "vault_url" {
  type    = string
  default = "localhost"
}

variable "vault_azuresql_secrets_mount" {
  type    = string
  default = "azuresql"
}

variable "vault_azuresql_secrets_role" {
  type    = string
  default = "app-role"
}

variable "vault_azuresql_secrets_connection" {
  type    = string
  default = "my-mssql-database"
}

variable "azuresql_db_server_url" {
  type    = string
  default = "test-server.database.windows.net"
}

variable "azuresql_db_name" {
  type    = string
  default = "test-db"
}
