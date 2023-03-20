locals {
  gateway_generation         = "Generation1"
  gateway_type               = "Vpn"
  gateway_vpn_type           = "RouteBased"
  gateway_enable_bgp         = false
  gateway_activeactive       = false
  gateway_sku                = "VpnGw1"
  pip_allocation_method      = "Static"
  pip_sku                    = "Standard"
  onpremises_connection_name = "${var.gateway_pip_name}-to-${var.local_gateway_name}"

  express_route_gateway_bypass       = false
  enable_bgp                         = false
  egress_nat_rule_ids                = []
  dpd_timeout_seconds                = 0
  ingress_nat_rule_ids               = []
  local_azure_ip_address_enabled     = false
  routing_weight                     = 0
  use_policy_based_traffic_selectors = false

  ipsecPolicies = {
    saLifeTimeSeconds   = 7200
    saDataSizeKilobytes = 102400000
    ipsecEncryption     = "AES256"
    ipsecIntegrity      = "SHA256"
    ikeEncryption       = "AES256"
    ikeIntegrity        = "SHA256"
    dhGroup             = "ECP384"
    pfsGroup            = "ECP384"
  }

}

resource "azurerm_public_ip" "gw-pip" {
  name                = var.gateway_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = local.pip_allocation_method

  sku = local.pip_sku

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "net_gw" {
  name                = var.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type       = local.gateway_type
  vpn_type   = local.gateway_vpn_type
  generation = local.gateway_generation

  active_active = local.gateway_activeactive
  enable_bgp    = local.gateway_enable_bgp
  sku           = local.gateway_sku

  ip_configuration {
    name                          = "default" #"vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.gw-pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }
  tags = var.tags

  timeouts {
    create = "60m"
    update = "60m"
    read   = "5m"
    delete = "60m"
  }
}

resource "azurerm_local_network_gateway" "onpremise" {
  name                = var.local_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  gateway_address     = var.onpremises_gw_address
  address_space       = var.onpremises_address_space

  tags = var.tags
}

resource "azurerm_virtual_network_gateway_connection" "onpremise" {
  name                = local.onpremises_connection_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.net_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.onpremise.id

  shared_key = var.onpremises_shared_key

  express_route_gateway_bypass       = local.express_route_gateway_bypass
  enable_bgp                         = local.enable_bgp
  egress_nat_rule_ids                = local.egress_nat_rule_ids
  dpd_timeout_seconds                = local.dpd_timeout_seconds
  ingress_nat_rule_ids               = local.ingress_nat_rule_ids
  local_azure_ip_address_enabled     = local.local_azure_ip_address_enabled
  routing_weight                     = local.routing_weight
  use_policy_based_traffic_selectors = local.use_policy_based_traffic_selectors

  ipsec_policy {
    sa_lifetime      = local.ipsecPolicies["saLifeTimeSeconds"]
    sa_datasize      = local.ipsecPolicies["saDataSizeKilobytes"]
    ipsec_encryption = local.ipsecPolicies["ipsecEncryption"]
    ipsec_integrity  = local.ipsecPolicies["ipsecIntegrity"]
    ike_encryption   = local.ipsecPolicies["ikeEncryption"]
    ike_integrity    = local.ipsecPolicies["ikeIntegrity"]
    dh_group         = local.ipsecPolicies["dhGroup"]
    pfs_group        = local.ipsecPolicies["pfsGroup"]
  }
  tags = var.tags
}
