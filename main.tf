variable "hcloud_token" {
  sensitive = true
}

variable "ssh_pub_keys" {
  type = list
}

variable "network_ip_range" {
  type = string
  default = "172.16.0.0/12"
}

variable "network_zone" {
  type = string
  default = "eu-central"
}

variable "subnet_ip_range" {
  type = string
  default = "172.16.0.0/16"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "ssh_source_ips" {
  type = list
  default = [
    "0.0.0.0/0",
    "::/0"
  ]
}

variable "location" {
  type = string
  default = "fsn1"
}

variable "web_server_type" {
  type = string
  default = "cpx11"
}

variable "web_keep_disk" {
  type = bool
  default = true
}

variable "web_private_ip" {
  type = string
  default = "172.16.0.11"
}

variable "image" {
  type = string
  default = "centos-stream-9"
}

terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.36.1"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_network" "net" {
  name = "net"
  ip_range = var.network_ip_range
}

resource "hcloud_network_subnet" "subnet" {
  network_id = hcloud_network.net.id
  type = "cloud"
  network_zone = var.network_zone
  ip_range = var.subnet_ip_range
}

resource "hcloud_firewall" "firewall" {
  name = "firewall"
  rule {
    direction = "in"
    protocol = "tcp"
    port = var.ssh_port
    source_ips = var.ssh_source_ips
  }
  rule {
    direction = "in"
    protocol = "tcp"
    port = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  rule {
    direction = "in"
    protocol = "tcp"
    port = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  rule {
    direction = "in"
    protocol = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_server" "web" {
  name = "website"
  image = var.image
  server_type = var.web_server_type
  location = var.location
  keep_disk = var.web_keep_disk
  
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  network {
    network_id = hcloud_network.net.id
    ip = var.web_private_ip
  }
  user_data = templatefile("cloud_init.tftpl", {
    ssh_pub_keys = var.ssh_pub_keys
  })
  firewall_ids = [
    hcloud_firewall.firewall.id
  ]
  depends_on = [
    hcloud_network_subnet.subnet,
    hcloud_firewall.firewall
  ]
}
