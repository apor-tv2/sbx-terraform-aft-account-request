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
    "Learn Tutorial" = "AFT"
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

module "ControlTowerManagement" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+sbxctmgmt@tv2.dk"
    AccountName               = "CTMgmt"
    ManagedOrganizationalUnit = "Root"
    SSOUserEmail              = "apor+sbxctmgmt@tv2.dk"
    SSOUserFirstName          = "Control Tower"
    SSOUserLastName           = "Management"
  }

  account_tags = {
    "SBX Learning" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "apor testing scp with aft"
    change_reason       = "Roll SCPs on Control Tower Management Account"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "control-tower-management"
}
