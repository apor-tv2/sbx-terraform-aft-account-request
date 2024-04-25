module "TestEnrollment1" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+testenrollment1@tv2.dk"
    AccountName               = "testenrollment1"
    ManagedOrganizationalUnit = "sandbox"
    SSOUserEmail              = "apor+enrollment1@tv2.dk"
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

#  account_customizations_name = "testenrollment1"
}
module "TestEnrollment2" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+testenrollment2@tv2.dk"
    AccountName               = "testenrollment2"
    ManagedOrganizationalUnit = "sandbox"
    SSOUserEmail              = "apor+enrollment2@tv2.dk"
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

  account_customizations_name = "testenrollment2"
}
