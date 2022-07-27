source "qemu" "example" {
  iso_url          = "https://deb.debian.org/debian/dists/bullseye/main/installer-amd64/current/images/netboot/mini.iso"
  iso_checksum     = "c48b4ce1f5e4d62c2a42012aaae80db095163d8367b1c73a650499cf8521b4a7"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  disk_size        = "5000M"
  format           = "qcow2"
  accelerator      = "kvm"
  ssh_username     = "packer"
  ssh_timeout      = "30m"
  net_device       = "virtio-net"
  disk_interface   = "virtio"
  http_directory = "test2"
  ssh_private_key_file = "test"
  memory = 2048
  boot_command = [
    "<esc><wait>",
    "auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"
  ]
}

build {
  sources = ["source.qemu.example"]
}
