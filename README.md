# HomeWork-TF-3

# Задание 1

![1](https://github.com/user-attachments/assets/2868e8bd-46de-4b98-8deb-518d63de9370)

![2](https://github.com/user-attachments/assets/4c69b952-3926-479c-92d1-6b2b5a0a08d1)

![3](https://github.com/user-attachments/assets/6eae9dd8-decc-4828-8158-fc940a09895d)

![4](https://github.com/user-attachments/assets/0ae23a5d-d1dd-4bfe-90bc-4d0ba853b8f9)



# Задание 2

2.1 
Созданы две ВМ с помощью count, назначена группа безопасности example_dynamic.

![image](https://github.com/user-attachments/assets/5a64a190-cb07-4da4-8bc2-113659d34115)


![image](https://github.com/user-attachments/assets/ab093652-1f6a-4ef2-9f6c-abd23a7beb5c


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

# Задание 4
