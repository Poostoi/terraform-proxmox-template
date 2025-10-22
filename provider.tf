terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url =  var.pm_url
  pm_api_token_id = "terraform-prov@pve!token"
  pm_api_token_secret = var.pm_token

    # debug log
  #  pm_log_enable = true
  #  pm_log_file   = "terraform-plugin-proxmox.log"
  #  pm_debug      = true
  #  pm_log_levels = {
  #    _default    = "debug"
  #    _capturelog = ""
  #  }
}
