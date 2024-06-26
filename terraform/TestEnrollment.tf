module "TestEnrollment3" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "apor+testenrollment3@tv2.dk"
    AccountName               = "testenrollment3"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "apor+testenrollment3@tv2.dk"
    SSOUserFirstName          = "Anders"
    SSOUserLastName           = "Porsbo"
  }

  account_tags = {
    "CostCenterNumber" = "4693"
    "CostCenterBrief" = "DCP"
    "Usage" = "Testing Enrollment of accounts"
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
