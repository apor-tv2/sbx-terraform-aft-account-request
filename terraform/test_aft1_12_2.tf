module "test_aft1_12_2" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+test_aft1_12_2@tv2.dk"
    AccountName               = "test aft 1.12.2 renamed"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "apor+sbxctmgmt@tv2.dk"
    SSOUserFirstName          = "Anders"
    SSOUserLastName           = "Porsbo"
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

  account_customizations_name = "standard"
}
