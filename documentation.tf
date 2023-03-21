variable "output_md_file" {
  type        = string
  description = "location of the file where this cloud foundation kit module generates its documentation output"
  default     = "./README.md"
}

resource "local_file" "output_md" {
  filename = var.output_md_file
  content  = <<EOF
# DR network creation

Deploys a Azure Network Gateway in the DR region.

# Usage

Populate the variables.auto.tfvars with the values and complete

## Secret values

The repos will ignore any variables file with the name *.local.auto.tfvars.
You can use this to create a file containing the IP and the preshared key. They won't be commited to the repo.
```hcl
onpremises_gw_address = "XXX.XXX.XXX.XXX"
onpremises_shared_key = "thisIsSuperSecurePSK23!"
```

# To-DO

run TF docs, integrate the git-hook (fmt, validate,...) maybe some testing

# Deployed resources

## VNET
- resource_group_name   = `${data.azurerm_resource_group.hub-rg.name}`
- location              = `${data.azurerm_resource_group.hub-rg.location}`
- virtual_network_name  = `${local.hub_virtual_network_name}`
- address_space         = `${var.hub_vnet_address_space}`
- gateway_subnet        = `${var.gateway_subnet_address_space}`
- vnet_dns_servers      = `${join(", ", var.hub_nameservers)}`

## Network Gateway
- gateway_name             = `${local.gateway_name}`
- gateway_public_ip        = `${module.gateway.gateway-pip-address}`
- onpremises_address_space = `${join(", ", var.onpremises_address_space)}`

# Documentation


EOF
}