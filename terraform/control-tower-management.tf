module "ControlTowerManagement" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+sbxctmgmt@tv2.dk"
    AccountName               = "CTMgmt"
    ManagedOrganizationalUnit = "Root"
    SSOUserEmail              = "apor+sbxctmgmt@tv2.dk"
    SSOUserFirstName          = "AWS Control Tower"
    SSOUserLastName           = "Admin"
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
