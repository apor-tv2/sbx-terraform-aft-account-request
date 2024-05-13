module "sbxaudit" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+sbxaudit@tv2.dk"
    AccountName               = "Sbx Audit"
    ManagedOrganizationalUnit = "Security"
    SSOUserEmail              = "apor+sbxctmgmt@tv2.dk"
    SSOUserFirstName          = "Anders"
    SSOUserLastName           = "Porsbo"
  }

  account_tags = {
    "CostCenterNumber" = "4693"
    "CostCenterBrief" = "DCP"
    "Usage" = "Audit with AWS Config, SecurityHub and GuardDuty"
  }

  change_management_parameters = {
    change_requested_by = "APOR"
    change_reason       = "Adding account tags"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sbxaudit"
}
