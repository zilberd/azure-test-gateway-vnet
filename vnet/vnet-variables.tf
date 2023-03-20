variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "tags" { type = map(any) }
variable "virtual_network_name" { type = string }
variable "address_space" { type = string }
variable "subnet_name" { type = string }
variable "subnet_address_space" { type = string }
variable "vnet_dns_servers" { type = list(string) }