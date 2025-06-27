#!/bin/bash

vault auth enable -path=jwt/tfc jwt
#Success! Enabled jwt auth method at: jwt/tfc/

vault write auth/jwt/tfc/config \
  bound_issuer="https://app.terraform.io" \
  oidc_discovery_url="https://app.terraform.io"
#Success! Data written to: auth/jwt/tfc/config

vault write sys/auth/jwt/tfc/tune \
 default_lease_ttl=5m \
 max_lease_ttl=30m \
 token_type=default-service
#Success! Data written to: sys/auth/jwt/tfc/tune

vault write auth/jwt/tfc/role/tfc-admin-namespace-root -<<EOF
{
  "role_type": "jwt",
  "user_claim": "terraform_full_workspace",
  "bound_issuer": "https://app.terraform.io",
  "bound_audiences": ["vault.workload.identity"],
  "bound_claims_type": "glob",
  "bound_claims": {
    "sub": "organization:amora-hc:project:mutua-vault:workspace:mutua-vault-db-namespace-root:run_phase:*"
  },
  "token_policies": ["tfc-admin"],
  "token_ttl": "5m",
  "token_max_ttl": "10m",
  "token_type": "service"
}
EOF
#Success! Data written to: auth/jwt/tfc/role/tfc-admin-namespace-root

vault write auth/jwt/tfc/role/tfc-admin-namespace-vending -<<EOF
{
  "role_type": "jwt",
  "user_claim": "terraform_full_workspace",
  "bound_issuer": "https://app.terraform.io",
  "bound_audiences": ["vault.workload.identity"],
  "bound_claims_type": "glob",
  "bound_claims": {
    "sub": "organization:amora-hc:project:mutua-vault:workspace:mutua-vault-db-namespace-vending:run_phase:*"
  },
  "token_policies": ["tfc-admin"],
  "token_ttl": "5m",
  "token_max_ttl": "10m",
  "token_type": "service"
}
EOF
#Success! Data written to: auth/jwt/tfc/role/tfc-admin-namespace-root

vault policy write tfc-admin ./terraform-cloud/policies/tfc_admin_policy.hcl
#Success! Uploaded policy: tfc-admin
