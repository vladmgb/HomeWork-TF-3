output "my_vm" {
  value = flatten([
    [for i in yandex_compute_instance.web : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }],
    [for i in [yandex_compute_instance.storage-vm] : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }],
    [for i in yandex_compute_instance.db : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }]
  ])
}