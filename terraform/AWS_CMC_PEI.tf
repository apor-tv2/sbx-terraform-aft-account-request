module "yaml_parser_generic_accounts" {
  for_each = { for account, yaml in yamldecode(file("../AWS_CMC_PEI.yaml")).account : account => yaml }
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

  # After release 1.3.3 (at least is when I noticed it)
  # - The custom_fields provided in the account request repo are stored as ssm parameters in the target account as:
  # - /aft/account-request/custom-fields/CUSTOM_FIELD_NAME
  # - Reference: https://learn.hashicorp.com/tutorials/terraform/aws-control-tower-aft
  custom_fields = try(each.value.custom_fields == null ? {} : each.value.custom_fields, local.default.custom_fields)

  account_customizations_name = each.value.AccountCustomizationsName
}

module "PEISandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "aws-pei-sandbox2-test@tv2.dk"
    AccountName = "PEI - Sandbox2 - sbxaft testing"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserFirstName          = "AFT-sbx"
    SSOUserLastName           = "Automation"
    SSOUserEmail              = "aws+sbx-sso@tv2.dk"
  }

  #account_tags = {}
  account_tags = {
        "TV2:Domain" = "Content Planning and Management"
        "TV2:Team" = "CMC"
        "TV2:CostCenterNumber" = "4642"
        "TV2:AccountEnvironment" = "Sandbox"
        "TV2:ApplicationOrUsage" = "PEI"
        "TV2:EnvGroup" = "non-prod"
  }
  #account_tags = {
  #  "Owner"       = "john.doe@amazon.com"
  #  "ABC:Owner"       = "john.doe@amazon.com"
  #  "ABC:Division"    = "ENT"
  #  "ABC:Environment" = "Dev"
  #  "ABC:CostCenter"  = "123456"
  #  "ABC:Vended"      = "true"
  #  "ABC:DivCode"     = "102"
  #  "ABC:BUCode"      = "ABC003"
  #  "ABC:Project"     = "123456"
  #}

  change_management_parameters = {
      "change_requested_by" = "APOR Test for PEI Team"
      "change_reason" = "Account Vending"
  }

  custom_fields = {
    "EnvGroup" = "non-prod"
    "vpc_cidr" = "10.64.18.0/23"
    "vpc_cidr_private" = "10.64.18.0/24"
    "vpc_cidr_private_AZa" = "10.64.18.0/26"
    "vpc_cidr_private_AZb" = "10.64.18.64/26"
    "vpc_cidr_private_AZc" = "10.64.18.128/26"
    "vpc_cidr_prublic" = "10.64.19.0/24"
    "vpc_cidr_public_AZa" = "10.64.19.0/26"
    "vpc_cidr_public_AZb" = "10.64.19.64/26"
    "vpc_cidr_public_AZc" = "10.64.19.128/26"
  }

  account_customizations_name = "standard"
}
