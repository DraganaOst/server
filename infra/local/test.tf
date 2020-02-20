resource "libvirt_domain" "test" {
  name = "test"
  memory = "1024"
  vcpu = 1

  network_interface {
    network_name = libvirt_network.local_network.name
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  disk {
    volume_id = libvirt_volume.test_image.id
  }
}
