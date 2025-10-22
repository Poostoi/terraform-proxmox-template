resource "proxmox_vm_qemu" "terraform-nods" {
  count       = 3
  agent       = 1
  name        = "name${count.index + 1}"
  target_node = var.proxmox_host
  vmid        = "101${count.index + 1}"
  clone       = var.template_name
  os_type     = "cloud-init"
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  boot       = "order=scsi0"
  memory      = 2048

  cpu {
    sockets     = 1
    cores       = 2  
    type        = "x86-64-v2-AES"
  }

  disks {
    scsi {
        scsi0 {
          disk {
            size = "33G"
            storage = "local-lvm"
          }
        }
        scsi1 {
            cloudinit {
              storage = "local-lvm"
            }
        }
      }
    }

  network {
    id        = 0
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
  }

  vga {
    type = "std"
  }

  ipconfig0 = "ip=192.168.1.${count.index + 1}/24,gw=192.168.1.1"
  nameserver = "8.8.8.8"
  searchdomain = "local"
  ciuser    = var.ciuser
  cipassword = var.cipassword
  sshkeys = var.ssh_keys
}
