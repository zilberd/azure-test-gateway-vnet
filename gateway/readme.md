## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_local_network_gateway.onpremise](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_public_ip.gw-pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_network_gateway.net_gw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.onpremise](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | n/a | `string` | n/a | yes |
| <a name="input_gateway_pip_name"></a> [gateway\_pip\_name](#input\_gateway\_pip\_name) | n/a | `string` | n/a | yes |
| <a name="input_gateway_subnet_id"></a> [gateway\_subnet\_id](#input\_gateway\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_local_gateway_name"></a> [local\_gateway\_name](#input\_local\_gateway\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_onpremises_address_space"></a> [onpremises\_address\_space](#input\_onpremises\_address\_space) | n/a | `list(string)` | n/a | yes |
| <a name="input_onpremises_gw_address"></a> [onpremises\_gw\_address](#input\_onpremises\_gw\_address) | n/a | `string` | n/a | yes |
| <a name="input_onpremises_shared_key"></a> [onpremises\_shared\_key](#input\_onpremises\_shared\_key) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway-name"></a> [gateway-name](#output\_gateway-name) | n/a |
| <a name="output_local-gateway-id"></a> [local-gateway-id](#output\_local-gateway-id) | n/a |
