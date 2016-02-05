variable "project" {}
resource "digitalocean_droplet" "master" {
  count = "3"
  image = "ubuntu-14-04-x64"
  name = "${var.project}-k8s-master-${count.index+1}"
  region = "${var.region}"
  size = "4gb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    key_file = "${var.private_key}"
    timeout = "2m"
  }
}

resource "digitalocean_droplet" "node" {
  count = "2"
  image = "ubuntu-14-04-x64"
  name = "${var.project}-k8s-node-${count.index+1}"
  region = "${var.region}"
  size = "4gb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    key_file = "${var.private_key}"
    timeout = "2m"
  }
}

