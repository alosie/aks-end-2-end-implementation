# This module creates and Azure Service Principal with an Azure generated password

resource "azuread_application" "sp_app" {
  display_name = var.app_display_name
}

resource "azuread_service_principal" "sp_sp" {
  application_id = azuread_application.sp_app.application_id
}

resource "azuread_service_principal_password" "sp_pwd" {
  service_principal_id = azuread_service_principal.sp_sp.object_id
}