locals {
  default = {

    SSOUserEmail        = "aws+sbx-sso@tv2.dk"
    SSOUserFirstName    = "AFT-sbx"
    SSOUserLastName     = "Automation"

    account_tags        = {}

    change_requested_by = "YAML"
    change_reason       = "added from YAML"

    custom_fields       = {}

    account_customizations_name = ""
  }
}

#local.default.SSOUserEmail
#local.default.SSOUserFirstName
#local.default.SSOUserLastName
#local.default.account_tags
#local.default.change_requested_by
#local.default.change_reason
#local.default.custom_fields
