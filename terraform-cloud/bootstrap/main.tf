module "tfe_oauth_client" {
  source             = "./../modules/github-oauth"
  tfc_organization   = var.tfc_organization
  github_oauth_token = var.github_oauth_token
}

module "namespace-root" {
  depends_on            = [module.tfe_oauth_client]
  source                = "./../modules/tfe-workspace"
  enable_tfc_agent_pool = var.enable_tfc_agent_pool
  github_organization   = var.github_organization
  github_repository     = var.github_repository
  tfc_organization      = var.tfc_organization
  tfc_project           = var.tfc_project
  tfc_workspace         = "${var.tfc_workspace_prefix}-namespace-root"
  tfc_working_directory = "${var.tfc_working_directory_prefix}/namespace-root"
  tfc_terraform_variables = {
    "azuresql_db_server_url"            = { value = var.azuresql_db_server_url }
    "azuresql_db_name"                  = { value = var.azuresql_db_name }
    "azuresql_db_vault_user"            = { value = "vault", sensitive = true }
    "azuresql_db_vault_password"        = { value = "yourStrong(!)Password", sensitive = true }
    "vault_azuresql_secrets_mount"      = { value = var.vault_azuresql_secrets_mount }
    "vault_azuresql_secrets_connection" = { value = var.vault_azuresql_secrets_connection }
    "vault_azuresql_secrets_role"       = { value = var.vault_azuresql_secrets_role }
  }
  vault_address     = var.vault_address_tfc_agent
  vault_auth_path   = vault_jwt_auth_backend.tfc.path
  vault_auth_role   = "${var.vault_auth_role_prefix}-namespace-root"
  vault_policy_name = vault_policy.tfc_admin.name
}

module "namespace-vending" {
  depends_on            = [module.tfe_oauth_client]
  source                = "./../modules/tfe-workspace"
  enable_tfc_agent_pool = var.enable_tfc_agent_pool
  github_organization   = var.github_organization
  github_repository     = var.github_repository
  tfc_organization      = var.tfc_organization
  tfc_project           = var.tfc_project
  tfc_token             = var.tfc_token
  tfc_workspace         = "${var.tfc_workspace_prefix}-namespace-vending"
  tfc_working_directory = "${var.tfc_working_directory_prefix}/namespace-vending"
  tfc_terraform_variables = {
    "azuresql_db_server_url"            = { value = var.azuresql_db_server_url }
    "azuresql_db_name"                  = { value = var.azuresql_db_name }
    "azuresql_db_vault_user"            = { value = "vault", sensitive = true }
    "azuresql_db_vault_password"        = { value = "yourStrong(!)Password", sensitive = true }
    "github_organization"               = { value = var.github_organization }
    "github_repository"                 = { value = var.github_repository }
    "tfc_organization"                  = { value = var.tfc_organization }
    "tfc_project"                       = { value = var.tfc_project }
    "tfc_workspace_prefix"              = { value = var.tfc_workspace_prefix }
    "vault_address"                     = { value = var.vault_address_tfc_agent }
    "vault_auth_path"                   = { value = vault_jwt_auth_backend.tfc.path }
    "vault_azuresql_secrets_mount"      = { value = var.vault_azuresql_secrets_mount }
    "vault_azuresql_secrets_connection" = { value = var.vault_azuresql_secrets_connection }
    "vault_azuresql_secrets_role"       = { value = var.vault_azuresql_secrets_role }
  }
  vault_address     = var.vault_address_tfc_agent
  vault_auth_path   = vault_jwt_auth_backend.tfc.path
  vault_auth_role   = "${var.vault_auth_role_prefix}-namespace-vending"
  vault_policy_name = vault_policy.tfc_admin.name
}








