variable project {
  description = "project"
}

variable ports {
  description = "ports on filewall"
  type = list(string)
  default = ["22"]
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable source_ranges {
  description = "source_ranges"
  default     = ""
}

variable zone {
  description = "zone"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "public key path"
  default     = "~/.ssh/baskakov.pub"
}

variable private_key_path {
  description = "private key path"
  default     = "~/.ssh/baskakov"
}

variable disk_image {
  type = string
  description = "disk image"
  default     = "ubuntu-1804-lts"
  # default     = "rhel-7-v20201112"

}

variable user {
  type = string
  description = "ssh-user"
}

variable vm_count {
  type = number
  description = "count vms"
}