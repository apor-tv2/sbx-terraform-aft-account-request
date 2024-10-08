module "yaml_parser_to_generic_accoount_request" {
  for_each = { for account, yaml in yamldecode(file("../GenericAccountRequest.yaml")).account : account => yaml }
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

  # The custom_fields provided in the account request repo are
  # stored as ssm parameters in the target account as:
  # - /aft/account-request/custom-fields/CUSTOM_FIELD_NAME
  # - Reference: https://learn.hashicorp.com/tutorials/terraform/aws-control-tower-aft
  custom_fields = (each.value.custom_fields.custom_fields_version >= 1.1 ? (
          merge(
                each.value.custom_fields,
                {vpc_private_subnet_tags: jsonencode(try(each.value.vpc_private_subnet_tags == null ? {} : each.value.vpc_private_subnet_tags,{}))},
                {vpc_public_subnet_tags: jsonencode(try(each.value.vpc_public_subnet_tags == null ? {} : each.value.vpc_public_subnet_tags,{}))},
          )) : (each.value.custom_fields))


  account_customizations_name = each.value.AccountCustomizationsName
}
