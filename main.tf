locals {
  hub_virtual_network_name = "${var.resources_prefixe}vnethub${var.resources_sufixe}"
  gateway_name             = "${var.resources_prefixe}vnetgw${var.resources_sufixe}"
  gateway_pip_name         = "${var.resources_prefixe}puipvnetvgw${var.resources_sufixe}"
  gateway_subnet_name      = "GatewaySubnet"
}


# Ref: Hub Resource Group
data "azurerm_resource_group" "hub-rg" {
  name = var.hub_resource_group_name
}

# Deploy the spoke VNET and peer is with the hub VNET
# Create the endpoints subnet
module "vnet" {
  source               = "./vnet"
  resource_group_name  = data.azurerm_resource_group.hub-rg.name
  location             = data.azurerm_resource_group.hub-rg.location
  tags                 = var.tags
  virtual_network_name = local.hub_virtual_network_name
  address_space        = var.hub_vnet_address_space
  subnet_name          = local.gateway_subnet_name
  subnet_address_space = var.gateway_subnet_address_space
  vnet_dns_servers     = var.hub_nameservers
}

module "gateway" {
  source                   = "./gateway"
  resource_group_name      = data.azurerm_resource_group.hub-rg.name
  location                 = data.azurerm_resource_group.hub-rg.location
  tags                     = var.tags
  gateway_name             = local.gateway_name
  gateway_pip_name         = local.gateway_pip_name
  gateway_subnet_id        = module.vnet.subnet-id
  local_gateway_name       = var.onpremises_gateway_name
  onpremises_gw_address    = var.onpremises_gw_address
  onpremises_address_space = var.onpremises_address_space
  onpremises_shared_key    = var.onpremises_shared_key
}