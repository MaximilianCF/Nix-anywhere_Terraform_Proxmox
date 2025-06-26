variable "pm_api_url" {
  type        = string
  description = "Endpoint da API do Proxmox"
  default     = "https://144.76.85.225:8006/api2/json"
}

variable "pm_user" {
  type        = string
  description = "Usuário para acessar o Proxmox"
  default     = "root"
}

variable "pm_password" {
  type        = string
  description = "Senha para acessar o Proxmox"
  sensitive   = true
  default     = "eBWJwbH35exqTB"
}

variable "pm_node" {
  type        = string
  description = "Nome do node Proxmox"
  default     = "n5"
}

variable "template_name" {
  type        = string
  description = "Nome do template no Proxmox"
  default     = "nix-anywhewre-template"
}

variable "pm_storage" {
  type        = string
  description = "Nome do storage onde salvar os discos"
  default     = "base-180-disk-0.qcow2"
}

variable "network_bridge" {
  type        = string
  description = "Bridge de rede do Proxmox"
  default     = "vmbr0"
}

