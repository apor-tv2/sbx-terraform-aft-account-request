module "yaml_parser_to_aftrequesttesting_account" {
  for_each = { for account, yaml in yamldecode(file("../AWS_AFTRequestTesting_account.yaml")).account : account => yaml }
  source   = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = each.value.AccountEmail
    AccountName               = each.value.AccountName
    ManagedOrganizationalUnit = each.value.ManagedOrganizationalUnit
    SSOUserEmail              = lookup(each.value, "SSOUserEmail", local.default.SSOUserEmail)
    SSOUserFirstName          = lookup(each.value, "SSOUserFirstName", local.default.SSOUserFirstName)
    SSOUserLastName           = lookup(each.value, "SSOUserLastName", local.default.SSOUserLastName)
  }

  account_tags = try(each.value.account_tags == null ? {} : each.value.account_tags, local.default.account_tags)

  change_management_parameters = {
    change_requested_by = try(each.value.change_management_parameters.change_requested_by, local.default.change_requested_by)
    change_reason       = try(each.value.change_management_parameters.change_reason, local.default.change_reason)
  }

  custom_fields = try(each.value.custom_fields == null ? {} : each.value.custom_fields, local.default.custom_fields)

  account_customizations_name = lookup(each.value, "AccountCustomizationsName", local.default.AccountCustomizationsName)
}
