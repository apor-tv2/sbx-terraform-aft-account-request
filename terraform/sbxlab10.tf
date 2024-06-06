module "sbxlab10" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+sbxlab10@tv2.dk"
    AccountName               = "sbxlab10"
    ManagedOrganizationalUnit = "Labs"
    SSOUserEmail              = "apor+sbxlab10sso@tv2.dk"
    SSOUserFirstName          = "Anders"
    SSOUserLastName           = "Porsbo"
  }

  account_tags = {
    "CostCenterNumber" = "4693"
    "CostCenterBrief" = "DCP"
    "Usage" = "lab account, this account is used for testing renaming of accounts"
  }

  change_management_parameters = {
    change_requested_by = "APOR"
    change_reason       = "adding account tags"
  }

  custom_fields = {
    group = "non-prod-changed"
  }

  account_customizations_name = "sbxlab10"
}
