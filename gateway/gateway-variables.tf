variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "tags" { type = map(any) }
variable "gateway_name" { type = string }
variable "gateway_pip_name" { type = string }
variable "gateway_subnet_id" { type = string }
variable "local_gateway_name" { type = string }
variable "onpremises_gw_address" { type = string }
variable "onpremises_address_space" { type = list(string) }
variable "onpremises_shared_key" { type = string }