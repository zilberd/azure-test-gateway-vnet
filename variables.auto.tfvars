hub_resource_group_name      = "DR-RG-Manual"
hub_vnet_address_space       = "10.40.128.0/19"
gateway_subnet_address_space = "10.40.128.0/27"

hub_nameservers = [
  "192.168.123.110",
  "192.168.123.111"
]

resources_sufixe  = "prod22"
resources_prefixe = "helbnetz"

onpremises_gateway_name = "cpvpnfw22"
onpremises_address_space = [
  "10.0.0.0/16",
  "172.16.0.0/12",
  "192.168.96.0/20",
  "192.168.123.0/24"
]

tags = {
  environment = "dev"
  owner       = "Dimitri Zilber"
  source      = "terraform"
}
