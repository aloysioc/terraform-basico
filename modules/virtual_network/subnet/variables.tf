variable "rg_name" {
  type        = string
  default     = ""
  description = "Name of Resouce Group"
}

variable "network_name" {
  type        = string
  description = "Recebe o nome da vnet a qual a subnet será associada"
}
variable "subnet_name" {
  description = "informa o nome da subnet"
}
variable "subnet_cidr" {
  description = "Define o endereçamento da subnet, deve estar dentro do range criado na vnet"
}
variable "delegation_name" {
  type        = string
  description = "Define o nome da delegação que será delegado"
  default     = null
}
variable "service_delegation_name" {
  description = "Define o nome do serviço que será delegado"
  default     = null
}
variable "service_delegation_actions" {
  description = "Define as ações do serviço que será delegado"
  default     = null

}