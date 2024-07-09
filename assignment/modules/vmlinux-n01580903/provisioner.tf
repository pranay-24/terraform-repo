resource "null_resource" "display_hostnames" {
  count = length(var.vm_map)

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key_path)
      host        = values(azurerm_public_ip.public_ip)[count.index].ip_address
    }
  }

  depends_on = [azurerm_linux_virtual_machine.vm]
}

variable "private_key_path" {
  type = string
}