variable "prefix" {
  default = "ADO_Build_Agent"
}

variable "location" {
  default = "UK South"
}

variable "vm_size" {
  default = "Standard_B2ms"
}

# Service Principal credentials
variable "subscription_id" {}

variable "tenant_id" {}

variable "client_id" {}
variable "client_secret" {}

# Declared but filled from a secret file (secrets.auto.tfvars)
# so as not to expose secrets to source control
variable "os_user" {}

variable "os_pass" {}
