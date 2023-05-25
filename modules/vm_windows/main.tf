# resource "azurerm_network_interface" "net_mgmt" {
#   count               = var.servers
#   name                = "${var.vm_name}${count.index + 1}-mgmtnic${count.index + 1}"
#   location            = var.region
#   resource_group_name = var.rg_name

#   ip_configuration {
#     name                          = "${var.vm_name}${count.index + 1}-ip${count.index + 1}"
#     subnet_id                     = var.subnet_mgmt_id
#     private_ip_address_allocation = var.ip_allocation_method
#   }
# }
resource "azurerm_public_ip" "publicip" {
  count                   = var.servers
  name                    = "${var.vm_name}${count.index + 1}-pip${count.index + 1}"
  location                = var.region
  resource_group_name     = var.rg_name
  allocation_method       = "Static"
  sku                     = "Standard"
  domain_name_label       = var.dns
  idle_timeout_in_minutes = 15
}

resource "azurerm_network_interface" "net_if" {
  count               = var.servers
  name                = "${var.vm_name}${count.index + 1}-nic${count.index + 1}"
  location            = var.region
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.vm_name}${count.index + 1}-ip${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_allocation_method
    public_ip_address_id          = azurerm_public_ip.publicip[count.index].id
  }
}

# data "template_file" "winrm" {
#   template = file("./modules/vm_windows/win_rm.ps1")
# }
# data "template_file" "mount_disk" {
#   template = file("./modules/virtual_machine2/mount_disk.sh")
# }
###################################
resource "azurerm_windows_virtual_machine" "vm" {
  count                 = var.servers
  name                  = "${var.vm_name}${count.index + 1}"
  location              = var.region
  resource_group_name   = var.rg_name
  network_interface_ids = [element(azurerm_network_interface.net_if.*.id, count.index)]
  size                  = var.vm_size
  admin_username        = var.adm_user
  admin_password        = var.adm_pass
  source_image_id       = "/subscriptions/521eff37-ed04-4486-9f3f-39c56c44bdf9/resourceGroups/finops-demo/providers/Microsoft.Compute/images/AMI-w2k19-custom1"

  #  source_image_reference {
  #    publisher = var.img_publisher
  #    offer     = var.img_offer
  #    sku       = "Devops-Reference"
  #    version   = var.img_version
  #  }

  os_disk {
    name                 = "${var.vm_name}${count.index + 1}osdisk${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
    disk_size_gb         = var.data_disk_size
    # custom_data = base64encode(data.template_file.winrm.rendered)
  }

  provisioner "remote-exec" {
    connection {
      host     = azurerm_public_ip.publicip[count.index].ip_address
      type     = "winrm"
      user     = var.adm_user
      password = var.adm_pass
      https    = "false"
      insecure = "true"
      use_ntlm = "true"
      port     = 5985
      timeout  = "10m"
    }
    inline = [
      "echo Estou aqui >> C:\\test.txt"
    ]
  }
}