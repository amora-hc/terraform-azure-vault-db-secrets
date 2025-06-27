module "delivery_namespace" {
  source            = "./../modules/namespace"
  namespace         = "delivery"
  description       = "Delivery namespace"
  admin_group_name  = "vault-delivery-admin"
  quota_lease_count = 201
  quota_rate_limit  = 202
}

module "delivery_workspace" {
  depends_on            = [module.delivery_namespace]
  source                = "./../modules/tfe-workspace"
  enable_tfc_agent_pool = var.enable_tfc_agent_pool
  github_organization   = var.github_organization
  github_repository     = var.github_repository
  tfc_organization      = var.tfc_organization
  tfc_project           = var.tfc_project
  tfc_workspace         = "${var.tfc_workspace_prefix}-namespace-delivery"
  tfc_working_directory = "${var.tfc_working_directory_prefix}/namespace-delivery"
  tfc_terraform_variables = {
    "vault_namespace" = { value = module.delivery_namespace.namespace }
  }
  vault_address   = var.vault_address
  vault_auth_path = var.vault_auth_path
  vault_auth_role = var.vault_auth_role #"tfc-admin-namespace-delivery"
  vault_namespace = module.delivery_namespace.namespace
}
