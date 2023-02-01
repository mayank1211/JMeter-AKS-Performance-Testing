variable "rg_name" {
  default = "performance-testing-rg-uks"
}

variable "rg_location" {
  default = "uksouth"
}

variable "acr_name" {
  default = "performancetestingacr"
}

variable "acr_sku" {
  default = "Basic"
}

variable "storage_account_name" {
  default = "performancetestingblob"
}

variable "storage_account_tier" {
  default = "Standard"
}

variable "storage_account_replication_type" {
  default = "LRS"
}

variable "container_name" {
  default = "reports"
}

variable "container_access_type" {
  default = "private"
}

variable "aks_name" {
  default = "performancetestingaks"
}

variable "aks_min_node_count" {
  default = 1
}

variable "aks_vm_size" {
  default = "Standard_D2_v2"
}

variable "aks_max_node_count" {
  default = 3
}

variable "tags" {
  description = "A map of the tags to use for the resources that are deployed"
  type        = map(string)
  default = {
    "service" : "Performance Testing Platform"
    "team" : "Solo"
    "environment" : "Development"
    "requested by" : "Mayank Patel"
    "product owner" : "Mayank Patel"
    "created by" : "Mayank Patel"
  }
}