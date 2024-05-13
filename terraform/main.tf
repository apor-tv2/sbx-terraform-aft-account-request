module "sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+sbx-sandbox1@tv2.dk"
    AccountName               = "sandbox1"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "apor+sbx-sandbox1-sso@tv2.dk"
    SSOUserFirstName          = "Sandbox1"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "CostCenterNumber" = "4693"
    "CostCenterBrief" = "DCP"
    "Usage" = "experiments sandbox1"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox"
}
