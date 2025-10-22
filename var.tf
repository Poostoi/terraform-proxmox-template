variable "proxmox_host" {
    default = "proxmox"
    type = string

}
variable "template_name" {
    default = "jammy-template"
    type = string
}

variable "ciuser" {
  type = string
  default = "ubuntu"
}

variable "cipassword" {
  type = string
  default = ""
}

variable "ssh_keys" {
    type = string
    default = ""
}

variable "pm_url" {
  type = string
  default = ""
}

variable "pm_token" {
  type = string
  default = ""
}
