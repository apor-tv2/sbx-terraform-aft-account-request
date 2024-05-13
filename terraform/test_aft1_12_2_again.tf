module "test_again_aft1_12_2" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+test_again_aft1_12_2@tv2.dk"
    AccountName               = "test_again aft 1.12.2"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "apor+sbxctmgmt@tv2.dk"
    SSOUserFirstName          = "Anders"
    SSOUserLastName           = "Porsbo"
  }

  account_tags = {
    "CostCenterNumber" = "4693"
    "CostCenterBrief" = "DCP"
    "Usage" = "testing creating acount again with upgraded AFT"
  }

  change_management_parameters = {
    change_requested_by = "APOR"
    change_reason       = "adding tags to accounts"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "standard"
}
