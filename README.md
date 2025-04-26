# HomeWork-TF-3

# Задание 1

Выполнил код.

![1](https://github.com/user-attachments/assets/2868e8bd-46de-4b98-8deb-518d63de9370)

«Группы безопасности» в ЛК Yandex Cloud

![2](https://github.com/user-attachments/assets/4c69b952-3926-479c-92d1-6b2b5a0a08d1)

![3](https://github.com/user-attachments/assets/6eae9dd8-decc-4828-8158-fc940a09895d)

![4](https://github.com/user-attachments/assets/0ae23a5d-d1dd-4bfe-90bc-4d0ba853b8f9)



# Задание 2

2.1 
Созданы две ВМ с помощью count, назначена группа безопасности example_dynamic.

![image](https://github.com/user-attachments/assets/5a64a190-cb07-4da4-8bc2-113659d34115)


![image](https://github.com/user-attachments/assets/ab093652-1f6a-4ef2-9f6c-abd23a7beb5c)


![image](https://github.com/user-attachments/assets/e2f51c49-55c1-495a-8673-5eea3987464e)

2.2
Описаны и созданы с помощью for_each loop еще две ВМ.
Порядок загрузки задан через depends_on.

![image](https://github.com/user-attachments/assets/3da9d6f6-7dc2-470f-b2b1-603b3cd1bb3c)


![image](https://github.com/user-attachments/assets/96ffe7a1-8bb7-40e0-90e2-b3fcd1f7e258)

Для ключа используется функция file

```
locals {
  ssh-keys = file("~/.ssh/ubuntu.pub")
}

....

 metadata = {
    ssh-keys = "ubuntu:${local.ssh-keys}"
    
  }
```

# Задание 3

1. Диски созданы

![image](https://github.com/user-attachments/assets/d1d2b291-b54e-4bfc-8b0e-b0ebc3cad6b3)

![image](https://github.com/user-attachments/assets/5865296a-5253-483e-ba69-8fec224fd78a)

2. Создана одна ВМ  storage и к ней подключены три диска.

   ![image](https://github.com/user-attachments/assets/d9c4151b-c773-4f4c-80cd-0d7dc5e0ffeb)


   ![image](https://github.com/user-attachments/assets/f0d71342-0e58-4496-b6c6-8daebadd2cd9)




# Задание 4

Создал файл ansible.tf по примеру.

![image](https://github.com/user-attachments/assets/a00c8fbe-3af0-45fd-a8d4-aefb13a1e1a0)

Создал шаблон hosts.tftpl по примеру.

![image](https://github.com/user-attachments/assets/00111a40-c6cd-4ab1-b565-8fbad7d25cfa)

Добавил переменую fqdn.

```
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"]==null ? i["network_interface"][0]["ip_address"] : i["network_interface"][0]["nat_ip_address"]} fqdn=${i["hostname"] != "" ? "${i["hostname"]}.ru-central1.internal" : replace(i["fqdn"], "auto.internal", "ru-central1.internal")}
```
Результат:

![image](https://github.com/user-attachments/assets/53f31a16-9a9d-49dd-bd9d-1f53ac079746)


# Задание 5*

Код:

```hcl
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
```

Результат:

![image](https://github.com/user-attachments/assets/ff5a032b-8678-4cd3-85aa-578522c2fe0a)


