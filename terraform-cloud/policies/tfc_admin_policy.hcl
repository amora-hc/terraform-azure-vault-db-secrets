# Create and manage ACL policies
path "sys/policies/acl/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl" {
   capabilities = ["list"]
}

path "auth/token/create"
{
  capabilities = ["update"]
}

path "sys/namespaces/*" {
  capabilities = ["read", "update", "delete"]
}

path "+/sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete"]
}

# Create and manage identities
path "identity/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List identities
path "identity" {
    capabilities = ["list"]
}

# Create and manage identities
path "+/identity/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List identities
path "+/identity" {
    capabilities = ["list"]
}

# Create and manage auth jwt mounts
path "auth/jwt" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "auth/jwt/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "+/auth/jwt" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
 
path "+/auth/jwt/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create and manage auth mounts
path "auth/oidc" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "auth/oidc/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/auth" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "+/sys/auth" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "+/sys/auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts/auth" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts/auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "+/sys/mounts/auth" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
 
path "+/sys/mounts/auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "azuresql*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "azuresql*/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create and manage quota policies
path "sys/quotas/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "secret/data/mssql/vaultuser-creds" {
  capabilities = ["read"]
}
