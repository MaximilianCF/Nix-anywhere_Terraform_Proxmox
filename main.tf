terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.78.2"
    }
  }
}

provider "proxmox" {
  endpoint = var.pm_api_url
  username = var.pm_user
  password = var.pm_password
  insecure = true
}

resource "proxmox_virtual_environment_vm" "vm-nixos" {
  name        = "vm-nixos"
  description = "VM criada via Terraform para usar NixOS"
  node_name   = var.pm_node

  clone {
    vm_id = 108
  }

  memory {
    dedicated = 2048
  }
  cpu {
    cores = 2
  }
  disk {
    size         = 20
    datastore_id = var.pm_storage
    interface    = "scsi"
    #file_format    = "qcow2"
  }
  agent {
    enabled = true
  }
  network_device {
    model  = "virtio"
    bridge = var.network_bridge
  }

  initialization {
    user_account {
      username = "root"
      keys     = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhwyXSdbugqryGu9rmstw/9wPGfr79nQWqMqa2AH8VC proxmox-access"]
    }
  }
}

