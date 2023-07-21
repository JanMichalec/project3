resource "azurerm_network_interface" "" {
  name                = ""
  location            = ""
  resource_group_name = ""

  ip_configuration {
    name                          = "internal"
    subnet_id                     = ""
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = ""
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                = ""
  location            = ""
  resource_group_name = ""
  size                = "Standard_DS2_v2"
  admin_username      = ""
  network_interface_ids = []
  admin_ssh_key {
    username   = "admin"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI9G+9mgK/5hVKTdYXjPzaDw9IgNBuQNdE2Ide41hKWTL3LFiizhuNYolK2/a+MKubyeJBE8B3j0ADGQvajXotELXZQPKggM3MJ5UgWyzZeu1ac3Y3dSqCo+BL3OfJ73I8M41Q5H18h0/iGiIU2qVhkTRLYSbC7pvZTN4FFPQXpXIy6Ofmo+QA+Ysy5RoXX6LpMwM4H3aevKAqfiWTURQuKLViPh/wfRU42IRlr5YBYxRpb15maYctzAIW1tInRl7pOL0O4odiZUFATg5fZ3FPctc6U8WAB3i51bmtaMmZk/cki5hXST9tafSRnRX38QFPCtQwDJwbYbkqMr7KWUiRatVSd1Z16JsKpGY6iFvJdTud71c3STUceVVx2tlD/ONwMip17AlzeYjbTAZnFGyNsoD318Kykv5UJ22oT1hzEfyLWSA4x1E/PONEtpK1w3CIvPTNqqwIkF5h7hFIoIG4AtKQFgGaw5TaybCz5cLdtjPSet+ndiwMsXBw4T6CDcM= michalec@EW10LAP1017651"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
