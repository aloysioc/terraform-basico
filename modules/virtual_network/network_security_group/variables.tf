variable "nsg_name" {
  type    = string
  default = "default_nsg"
}

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
variable "subnet_id" {
  description = "ID da subnet a ser atrelada ao security group"
}