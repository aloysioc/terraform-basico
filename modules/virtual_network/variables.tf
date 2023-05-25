variable "net_name" {
  type        = string
  description = "Define o nome da rede"
}

variable "vnet_cidr" {
  description = "Define o endereçamento da rede"
}

variable "region" {
  type        = string
  default     = "East US"
  description = "Name of Region"
}

variable "rg_name" {
  type        = string
  default     = ""
  description = "Name of Resouce Group"
}