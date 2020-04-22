# Defined by env vars
variable "prefix" {
}

variable "os_user" {
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
