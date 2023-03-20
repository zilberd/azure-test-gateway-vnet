# name of the hub vnet
variable "hub_resource_group_name" {
  type        = string
  description = "Name of the RG for the hub VNET"
}

# prefixe for the resources
variable "resources_sufixe" {
  type        = string
  description = "sufixe for resources (zB: prod21)"
}

variable "resources_prefixe" {
  type        = string
  description = "prefixe for resources (zB: testdr)"
}

variable "hub_vnet_address_space" {
  type        = string
  description = "hub vnet adress space (greater than /27)"
  default     = "10.0.0.0/16"
}

variable "hub_nameservers" {
  type        = list(string)
  description = "ip of the custom DNS servers to be applied on the vnet"
}

variable "gateway_subnet_address_space" {
  type        = string
  description = "hub vnet adress space (/27)"
  default     = "10.0.0.0/27"
}

variable "onpremises_gateway_name" {
  type        = string
  description = "name of the local gateway"
  default     = "onpremises"
}

variable "onpremises_gw_address" {
  type        = string
  description = "IP of the onpremises gateway"
}

variable "onpremises_address_space" {
  type        = list(string)
  description = "list of ip ranges for on premises"
}

variable "onpremises_shared_key" {
  type        = string
  description = "IPSEK shared key"
}

variable "tags" {
  type        = map(any)
  description = "list of tags to be applied on resources"
}
