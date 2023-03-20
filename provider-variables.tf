# Azure authentication variables
variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription ID"
  default     = ""
}

variable "azure-client-id" {
  type        = string
  description = "Azure Client ID"
  default     = ""
}

variable "azure-client-secret" {
  type        = string
  description = "Azure Client Secret"
  default     = ""
}

variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant ID"
  default     = ""
}