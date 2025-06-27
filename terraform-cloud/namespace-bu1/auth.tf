#resource "vault_auth_backend" "kubernetes" {
#  type = "kubernetes"
#  path = "k8s-minikube"
#}

#resource "vault_kubernetes_auth_backend_config" "demo_auth_config" {
#  backend            = vault_auth_backend.kubernetes.path
#  kubernetes_host    = "https://${var.kubernetes_host}:443"
#  kubernetes_ca_cert = var.kubernetes_ca_cert
#  token_reviewer_jwt = var.token_reviewer_jwt
#}

#resource "vault_kubernetes_auth_backend_role" "app_role" {
#  backend                          = vault_auth_backend.kubernetes.path
#  role_name                        = "app-role"
#  bound_service_account_names      = var.kubernetes_sa_names
#  bound_service_account_namespaces = [var.vault_namespace]
#  token_policies                   = [vault_policy.app_policy.name]
#  alias_name_source                = "serviceaccount_name"
#  token_period                     = "3600" # 1 hour in seconds
#}

#resource "vault_policy" "app_policy" {
#  name   = "app-policy"
#  policy = <<EOT
#path "mongodb/static-creds/dev-mongodb-static" {
#  capabilities = ["read"]
#}
#EOT
#}
