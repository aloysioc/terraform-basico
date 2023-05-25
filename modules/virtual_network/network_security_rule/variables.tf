variable "region" {
  type        = string
  default     = "East US"
  description = "Name of Region"
}

variable "rg_name" {
  type        = string
  default     = "default"
  description = "Name of Resouce Group"
}
variable "name" {
  default = "defaultnsg"
}
variable "priority" {
  default = "100"
}
variable "direction" {
  default = "Outbound"
}
variable "access" {
  default = "Allow"
}
variable "protocol" {
  default = "*"
}
variable "source_port_range" {
  default = null
}
variable "destination_port_range" {
  default = null
}
variable "destination_port_ranges" {
  default = null
}
variable "source_address_prefix" {
  default = null
}
variable "source_address_prefixes" {
  default = null
}
variable "destination_address_prefix" {
  default = null
}
variable "destination_address_prefixes" {
  default = null
}
variable "network_security_group_name" {
  description = "Name of security group of rule to be applied"
}
