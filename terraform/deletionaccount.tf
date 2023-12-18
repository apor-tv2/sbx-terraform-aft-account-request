module "deletionaccount" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+deletionaccount@tv2.dk"
    AccountName               = "deletionaccount"
    ManagedOrganizationalUnit = "Labs"
    SSOUserEmail              = "apor+deletionaccountsso@tv2.dk"
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

  account_customizations_name = "deletionaccount"
}
