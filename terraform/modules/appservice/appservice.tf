resource "azurerm_app_service_plan" "test" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group

  sku {
    tier = "Free"
    size = "F1"
  }

  tags = {
    Project = var.project
  }
}

resource "azurerm_app_service" "test" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group
  app_service_plan_id = azurerm_app_service_plan.test.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }

  tags = {
    Project = var.project
  }
}
