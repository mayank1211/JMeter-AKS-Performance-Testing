resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_name
  tags                = var.tags

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.aks_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool_linux" {
  name                  = "jmeter"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.aks_vm_size
  priority              = "Spot"
  os_type               = "Linux"
  enable_auto_scaling   = true
  min_count             = var.aks_min_node_count
  max_count             = var.aks_max_node_count
  os_disk_size_gb       = 30
  tags                  = var.tags

  node_labels = {
    "nodepool-type" = "jmeter"
    "environment"   = "development"
    "nodepoolos"    = "linux"
    "app"           = "performance testing"
  }
}
