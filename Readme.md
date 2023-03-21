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
- resource_group_name   = `DR-RG-Manual`
- location              = `switzerlandnorth`
- virtual_network_name  = `helbnetzvnethubprod22`
- address_space         = `10.40.128.0/19`
- gateway_subnet        = `10.40.128.0/27`
- vnet_dns_servers      = `192.168.123.110, 192.168.123.111`

## Network Gateway
- gateway_name             = `helbnetzvnetgwprod22`
- gateway_public_ip        = `20.250.36.118`
- onpremises_address_space = `10.0.0.0/16, 172.16.0.0/12, 192.168.96.0/20, 192.168.123.0/24`

# Documentation


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.47.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gateway"></a> [gateway](#module\_gateway) | ./gateway | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./vnet | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.output_md](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [azurerm_resource_group.hub-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure-client-id"></a> [azure-client-id](#input\_azure-client-id) | Azure Client ID | `string` | `""` | no |
| <a name="input_azure-client-secret"></a> [azure-client-secret](#input\_azure-client-secret) | Azure Client Secret | `string` | `""` | no |
| <a name="input_azure-subscription-id"></a> [azure-subscription-id](#input\_azure-subscription-id) | Azure Subscription ID | `string` | `""` | no |
| <a name="input_azure-tenant-id"></a> [azure-tenant-id](#input\_azure-tenant-id) | Azure Tenant ID | `string` | `""` | no |
| <a name="input_gateway_subnet_address_space"></a> [gateway\_subnet\_address\_space](#input\_gateway\_subnet\_address\_space) | hub vnet adress space (/27) | `string` | `"10.0.0.0/27"` | no |
| <a name="input_hub_nameservers"></a> [hub\_nameservers](#input\_hub\_nameservers) | ip of the custom DNS servers to be applied on the vnet | `list(string)` | n/a | yes |
| <a name="input_hub_resource_group_name"></a> [hub\_resource\_group\_name](#input\_hub\_resource\_group\_name) | Name of the RG for the hub VNET | `string` | n/a | yes |
| <a name="input_hub_vnet_address_space"></a> [hub\_vnet\_address\_space](#input\_hub\_vnet\_address\_space) | hub vnet adress space (greater than /27) | `string` | `"10.0.0.0/16"` | no |
| <a name="input_onpremises_address_space"></a> [onpremises\_address\_space](#input\_onpremises\_address\_space) | list of ip ranges for on premises | `list(string)` | n/a | yes |
| <a name="input_onpremises_gateway_name"></a> [onpremises\_gateway\_name](#input\_onpremises\_gateway\_name) | name of the local gateway | `string` | `"onpremises"` | no |
| <a name="input_onpremises_gw_address"></a> [onpremises\_gw\_address](#input\_onpremises\_gw\_address) | IP of the onpremises gateway | `string` | n/a | yes |
| <a name="input_onpremises_shared_key"></a> [onpremises\_shared\_key](#input\_onpremises\_shared\_key) | IPSEK shared key | `string` | n/a | yes |
| <a name="input_output_md_file"></a> [output\_md\_file](#input\_output\_md\_file) | location of the file where this cloud foundation kit module generates its documentation output | `string` | `"./README.md"` | no |
| <a name="input_resources_prefixe"></a> [resources\_prefixe](#input\_resources\_prefixe) | prefixe for resources (zB: testdr) | `string` | n/a | yes |
| <a name="input_resources_sufixe"></a> [resources\_sufixe](#input\_resources\_sufixe) | sufixe for resources (zB: prod21) | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | list of tags to be applied on resources | `map(any)` | n/a | yes |

## Outputs

No outputs.
