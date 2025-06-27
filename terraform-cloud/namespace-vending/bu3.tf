module "bu3_namespace" {
  source            = "./../modules/namespace"
  namespace         = "bu3"
  description       = "Business Unit 3 namespace"
  admin_group_name  = "vault-bu3-admin"
  quota_lease_count = 201
  quota_rate_limit  = 202
}

module "bu3_workspace" {
  depends_on            = [module.bu3_namespace]
  source                = "./../modules/tfe-workspace"
  enable_tfc_agent_pool = var.enable_tfc_agent_pool
  github_organization   = var.github_organization
  github_repository     = var.github_repository
  tfc_organization      = var.tfc_organization
  tfc_project           = var.tfc_project
  tfc_workspace         = "${var.tfc_workspace_prefix}-namespace-bu3"
  tfc_working_directory = "${var.tfc_working_directory_prefix}/namespace-bu3"
  tfc_terraform_variables = {
    "vault_namespace" = { value = module.bu1_namespace.namespace }
  }
  vault_address   = var.vault_address
  vault_auth_path = var.vault_auth_path
  vault_auth_role = var.vault_auth_role #"tfc-admin-namespace-bu3"
  vault_namespace = module.bu3_namespace.namespace
}
