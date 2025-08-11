resource "vault_policy" "tfc_admin" {
  name   = var.vault_policy
  policy = file("${path.module}/../policies/tfc_admin_policy.hcl")
}

# Enable auth backend for HCP Terraform
resource "vault_jwt_auth_backend" "tfc" {
  type               = "jwt"
  path               = var.vault_auth_path
  description        = "JWT auth backend for Terraform Cloud"
  bound_issuer       = "https://app.terraform.io"
  oidc_discovery_url = "https://app.terraform.io"

  tune {
    default_lease_ttl = var.default_lease_ttl
    max_lease_ttl     = var.max_lease_ttl
    token_type        = var.token_type
  }
}