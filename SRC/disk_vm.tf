resource "yandex_compute_disk" "disk" {
count = 3
name = "disk-${count.index + 1}"
type      = "network-hdd"
zone      = "ru-central1-a"
size     = 1
}

resource "yandex_compute_instance" "storage-vm" {
 name = "storage"
 resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
   dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk[*].id
    content {
      disk_id = secondary_disk.value
    }
   }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }


}