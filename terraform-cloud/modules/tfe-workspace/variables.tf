variable "github_organization" {
  type        = string
  description = "Name of the GitHub organization."
}

variable "github_repository" {
  type        = string
  description = "Name of the GitHub repository."
}

#variable "tfe_oauth_client" {
#  description = "TFE OAuth client"
#}

variable "tfc_organization" {
  type        = string
  description = "Name of the TFC organization."
}

variable "tfc_project" {
  type        = string
  description = "Name of the TFC project."
}

variable "tfc_workspace" {
  type        = string
  description = "Name of the TFC workspace."
}

variable "tfc_working_directory" {
  type        = string
  description = "Working directory for the TFC workspace."
}

variable "token_ttl" {
  type        = string
  description = "Default lease TTL for Vault tokens"
  default     = 300 # 5 minutes
}

variable "token_max_ttl" {
  type        = string
  description = "Maximum lease TTL for Vault tokens"
  default     = 600 # 10 minutes
}

variable "token_type" {
  type        = string
  description = "Token type for Vault tokens"
  default     = "service"
}

variable "vault_auth_path" {
  type        = string
  description = "Mount path where JWT Auth will be configured"
}

variable "vault_address" {
  type        = string
  description = "Vault API endpoint"
}

variable "vault_auth_role" {
  type        = string
  description = "Vault role name"
}

variable "vault_namespace" {
  type        = string
  description = "Vault namespace"
  default     = null
}

variable "vault_policy_name" {
  type        = string
  description = "Vault policy name"
  default     = "tfc-namespace-admin"
}

variable "vault_token_type" {
  type        = string
  description = "Token type for Vault tokens"
  default     = "service"
}

variable "enable_tfc_agent_pool" {
  type    = bool
  default = false
}

variable "terraform_version" {
  type        = string
  description = "Version of Terraform to use"
  default     = "~> 1.11.0"
}

variable "tfc_terraform_variables" {
  type = map(object({
    value     = string
    sensitive = optional(bool, false)
  }))
  description = "Map of additional Terraform variables"
  default     = {}
}

variable "tfc_environment_variables" {
  type = map(object({
    value     = string
    sensitive = optional(bool, false)
  }))
  description = "Map of additional Envrionment variables"
  default     = {}
}

variable "tfc_token" {
  type        = string
  description = "TFC API token"
  default     = null
}

variable "vault_default_lease_ttl" {
  type        = string
  description = "Default lease TTL for Vault tokens"
  default     = "10m"
}

variable "vault_max_lease_ttl" {
  type        = string
  description = "Maximum lease TTL for Vault tokens"
  default     = "30m"
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

variable "azuresql_db_vault_user" {
  type    = string
  default = "vault"
}

variable "azuresql_db_vault_password" {
  type    = string
  default = "pass"
}