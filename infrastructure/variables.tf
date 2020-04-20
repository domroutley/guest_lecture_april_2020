# Defined by env vars
variable "prefix" {
}

variable "location" {
  default = "UK South"
}

variable "vm_size" {
  default = "Standard_B1ms"
}

variable "port_number" {
  description = "Port to be opened."
  default     = "8080"
}

# Service Principal credentials
variable "subscription_id" {
}

variable "tenant_id" {
}

variable "client_id" {
}

variable "client_secret" {
}

# Declared but filled from a secret file (secrets.auto.tfvars)
# so as not to expose secrets to source control
variable "os_user" {
}
