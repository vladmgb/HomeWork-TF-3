
locals {
  ssh-keys = file("~/.ssh/ubuntu.pub")
}

variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 15
      core_fraction = 20
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 1
      disk_volume = 10
      core_fraction = 5
    }
  ]
}

resource "yandex_compute_instance" "db" {
depends_on = [yandex_compute_instance.web]    
for_each = { 
     for i in var.each_vm : i.vm_name => i }
name = each.value.vm_name
platform_id = "standard-v1"

 resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

    boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
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

  metadata = {
    ssh-keys = "ubuntu:${local.ssh-keys}"
    
  }
}
