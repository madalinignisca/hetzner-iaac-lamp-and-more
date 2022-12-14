 resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
      web_ip = hcloud_server.web.ipv4_address
    }
  )
  filename = "inventory"
}
