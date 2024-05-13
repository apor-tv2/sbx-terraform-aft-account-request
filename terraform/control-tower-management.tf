module "ControlTowerManagement" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+sbxctmgmt@tv2.dk"
    AccountName               = "APOR SBX CT-MGMT"
    ManagedOrganizationalUnit = "Root"
    SSOUserEmail              = "apor+sbxctmgmt@tv2.dk"
    SSOUserFirstName          = "AWS Control Tower"
    SSOUserLastName           = "Admin"
  }

  account_tags = {
    "CostCenterNumber" = "4693"
    "CostCenterBrief" = "DCP"
    "Usage" = "ControlTower Management"
  }

  change_management_parameters = {
    change_requested_by = "APOR"
    change_reason       = "APOR investigating account tagging for cost reports"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "control-tower-management"
}
