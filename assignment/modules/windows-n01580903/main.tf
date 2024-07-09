resource "azurerm_availability_set" "avset" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index + 1}-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = lower("${var.vm_name_prefix}-${count.index + 1}-${var.dns_label_prefix}")
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  availability_set_id = azurerm_availability_set.avset.id
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                = var.vm_count
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm[count.index].id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
    {
        "AntimalwareEnabled": true,
        "RealtimeProtectionEnabled": "true",
        "ScheduledScanSettings": {
            "isEnabled": "true",
            "scanType": "Quick",
            "day": "7",
            "time": "120"
        },
        "Exclusions": {
            "Extensions": "",
            "Paths": "",
            "Processes": ""
        }
    }
SETTINGS
}