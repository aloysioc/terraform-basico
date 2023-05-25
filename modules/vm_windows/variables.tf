variable "servers" {
  type = number
}

variable "vm_name" {
  type = string
}
variable "region" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus2"
}
variable "rg_name" {
  description = "A container that holds related resources for an Azure solution"
}
variable "subnet_id" {
  type        = string
  description = "Variable with the subnet ID"
}


variable "ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`"
  default     = "Dynamic"
}
variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}
variable "img_publisher" {
  default = "MicrosoftWindowsServer"
}
variable "img_offer" {
  default = "WindowsServer"
}
variable "img_sku" {
  default = "2019-Datacenter"
}
variable "img_version" {
  default = "latest"
}
variable "os_disk_type" {
  default     = "StandardSSD_LRS"
  description = "Tipo de disco a ser usado pelo SO da vm"
}
variable "data_disk_account_type" {
  default     = "StandardSSD_LRS"
  description = "Tipo de disco a ser usado pela VM"
}
variable "data_disk_size" {
  default     = 127
  description = "Size of the data disk"
}

variable "subnet_mgmt_id" {
  description = "id of the subnet for management network"
  default     = null
}
variable "subnet_nfs_id" {
  description = "id of the nfs subnet for management of subnet"
  default     = null
}
variable "subnet_elk_id" {
  description = "id of the elk subnet for management of subnet"
  default     = null
}

variable "subnets" {
  description = "id of the elk subnet for management of subnet"
  default     = null
}
variable "adm_user" {
  default = "ttechadmin"
}
variable "adm_pass" {
  default = "adm2022!!TTECH"
}
variable "dns" {
  description = "DNS for the public IP"
  default     = "defaultvmdns"
}