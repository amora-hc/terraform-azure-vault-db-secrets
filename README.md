# terraform-azure-vault-db-secrets

**Automated provisioning of Azure Vault secrets and database credentials using Terraform Cloud and HCP Vault.**

---

## Overview

This repository provides a modular solution to manage secrets in **Azure** and **HCP Vault** using **Terraform**. The automation is orchestrated through a hierarchy of Terraform Cloud (TFC) workspaces, enabling scalable, repeatable, and secure infrastructure provisioning. The only manual step required is the initial bootstrap, after which all other workspaces and resources are managed automatically.

---

## Architecture

- **terraform-cloud/init**
  - Initializes Vault with the required authentication method for HCP Terraform.
  - Creates the initial TFC workspaces: `namespace-root` and `namespace-vending`.

- **terraform-cloud/namespace-root**
  - Provisions all necessary resources in the Vault root namespace.

- **terraform-cloud/namespace-vending**
  - Acts as the "parent" workspace, responsible for creating additional TFC workspaces (one per Vault namespace).

- **terraform-cloud/namespace-apps, terraform-cloud/namespace-delivery, terraform-cloud/namespace-arquitectura, ...**
  - Each workspace manages resources for its corresponding Vault namespace.

---

## Prerequisites

- **Terraform v1.0+**
- **Terraform Cloud account**
- **Vault cluster**
- **Azure account with permissions to create Key Vaults and related resources**

---

## Quick Start

### 1. Create initial Workspace

- Manually create an HCP workspace under the corresponding project. 

Workspace name should ideally use the prefix `var.tfc_workspace_prefix` in order fo follow the workspaces naming convention used in this code. 

### 2. Configure Workspace VCS settings

- Add the Code repository and configure *Terraform Working directory* as `terraform-cloud/init`

Also add the following patterns to *Automatic Run triggering* section

```
terraform-cloud/init/**
terraform-cloud/modules/**
```

### 3. Edit Workspace variables

Edit the workspace Variables based on the content of the file `hcp.tfvars.example` and finally launch a New Run 


### 4. Automated Workspace Provisioning

- After the initial bootstrap step, all other Terraform code is executed automatically in TFC workspaces:
  - `namespace-root` provisions root namespace resources.
  - `namespace-vending` provisions additional workspaces for each Vault namespace.
  - Each generated workspace (e.g., `namespace-apps`, `namespace-delivery`, etc.) provisions resources for its respective namespace.

---

## Directory Structure

| Directory/Workspace                 | Purpose                                                                 |
|-------------------------------------|-------------------------------------------------------------------------|
| `terraform-cloud/init`              | Manual bootstrap: Vault auth + initial TFC workspaces                   |
| `terraform-cloud/namespace-root`    | TFC workspace for Vault root namespace resources                        |
| `terraform-cloud/namespace-vending` | TFC workspace to create per-namespace workspaces                        |
| `terraform-cloud/namespace-*`       | TFC workspaces for each Vault namespace (apps, delivery, arquitectura…) |

---

## Usage Notes

- **All configuration is driven by your `terraform.tfvars` file.** Ensure it is complete and accurate before starting.
- **The `.env` file is required only for the manual bootstrap step.** It must be sourced in your shell before running `terraform apply` locally.
- **Subsequent runs and all other workspaces are managed automatically by Terraform Cloud.**