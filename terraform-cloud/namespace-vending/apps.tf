module "apps_namespace" {
  source            = "./../modules/namespace"
  namespace         = "apps"
  description       = "apps namespace"
  admin_group_name  = "vault-apps-admin"
  quota_lease_count = 201
  quota_rate_limit  = 202
}

module "apps_workspace" {
  depends_on            = [module.apps_namespace]
  source                = "./../modules/tfe-workspace"
  enable_tfc_agent_pool = var.enable_tfc_agent_pool
  github_organization   = var.github_organization
  github_repository     = var.github_repository
  tfc_organization      = var.tfc_organization
  tfc_project           = var.tfc_project
  tfc_workspace         = "${var.tfc_workspace_prefix}-namespace-apps"
  tfc_working_directory = "${var.tfc_working_directory_prefix}/namespace-apps"
  tfc_terraform_variables = {
    "vault_namespace"             = { value = module.apps_namespace.namespace }
    "azuresql_db_server_url"      = { value = var.azuresql_db_server_url }
    "azuresql_db_name"            = { value = var.azuresql_db_name }
    "azuresql_db_vault_user"      = { value = "vault", sensitive = true }
    "azuresql_db_vault_password"  = { value = "yourStrong(!)Password", sensitive = true }
    "vault_db_secrets_mount"      = { value = var.vault_azuresql_secrets_mount }
    "vault_db_secrets_connection" = { value = var.vault_azuresql_secrets_connection }
    "vault_db_secrets_role"       = { value = var.vault_azuresql_secrets_role }
  }
  vault_address   = var.vault_address
  vault_auth_path = var.vault_auth_path
  vault_auth_role = var.vault_auth_role #"tfc-admin-namespace-apps"
  vault_namespace = module.apps_namespace.namespace
}
