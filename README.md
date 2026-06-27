# CloudForge - Infraestructura como Código con Terraform + Ansible

CloudForge es un proyecto DevOps que automatiza el despliegue de infraestructura en AWS utilizando **Terraform**, y la configuración del servidor usando **Ansible**. El objetivo es levantar una aplicación web en Docker de forma completamente automatizada.

---

## Arquitectura

Terraform → AWS (VPC, Subnet, Security Group, EC2)
↓
Ansible → Configuración del servidor vía SSH
↓
Docker → Despliegue de Nginx con página web
↓
Usuario → Accede desde navegador

---

## Tecnologías usadas

- Terraform
- AWS (EC2, VPC, Security Groups)
- Ansible
- Docker
- Nginx
- WSL / Linux

---

## Estructura del proyecto

```text
cloudforge/
├── README.md
├── .gitignore
├── providers.tf
├── variables.tf
├── network.tf
├── security.tf
├── compute.tf
├── storage.tf
├── outputs.tf
├── terraform.tfvars
└── ansible/
    ├── inventory.ini
    └── playbook.yml
```

---

## Cómo desplegar

### 1. Inicializar Terraform

```bash
terraform init
```

### 2. Aplicar infraestructura

```bash
terraform apply
```

### 3. Configurar servidor con Ansible

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```

---

## Acceso a la aplicación

Una vez desplegado, abrir en el navegador:

http://<IP_PUBLICA_EC2>

Ejemplo:

http://3.91.25.189

---

## Requisitos importantes

- Tener un Key Pair creado en AWS  
- Configurar correctamente `key_name` en Terraform  
- Tener la llave `.pem` en `~/.ssh/` o ruta accesible por WSL  
- Security Group debe permitir puerto 22 (SSH) y 80 (HTTP)

---

## Problemas comunes (lecciones aprendidas)

- Permisos incorrectos en la llave SSH (`chmod 400`)  
- Uso de `/mnt/c` en WSL causando problemas de permisos  

---

## Objetivo del proyecto

Aprender e integrar:

- Infraestructura como Código (Terraform)
- Automatización de configuración (Ansible)
- Contenedores (Docker)
- Despliegue en la nube (AWS)

---

## Autor: Alejandro Maldonado

Proyecto realizado como práctica DevOps - CloudForge# CloudForge - Infraestructura como Código con Terraform + Ansible

CloudForge es un proyecto DevOps que automatiza el despliegue de infraestructura en AWS utilizando **Terraform**, y la configuración del servidor usando **Ansible**. El objetivo es levantar una aplicación web en Docker de forma completamente automatizada.

---

## Arquitectura

Terraform → AWS (VPC, Subnet, Security Group, EC2)
↓
Ansible → Configuración del servidor vía SSH
↓
Docker → Despliegue de Nginx con página web
↓
Usuario → Accede desde navegador

---

## Tecnologías usadas

- Terraform
- AWS (EC2, VPC, Security Groups)
- Ansible
- Docker
- Nginx
- WSL / Linux

---

## Estructura del proyecto

```text
cloudforge/
├── README.md
├── .gitignore
├── providers.tf
├── variables.tf
├── network.tf
├── security.tf
├── compute.tf
├── storage.tf
├── outputs.tf
├── terraform.tfvars
└── ansible/
    ├── inventory.ini
    └── playbook.yml
```

---

## Cómo desplegar

### 1. Inicializar Terraform

```bash
terraform init
```

### 2. Aplicar infraestructura

```bash
terraform apply
```

### 3. Configurar servidor con Ansible

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```

---

## Acceso a la aplicación

Una vez desplegado, abrir en el navegador:

http://<IP_PUBLICA_EC2>

Ejemplo:

http://3.91.25.189

---

## Requisitos importantes

- Tener un Key Pair creado en AWS  
- Configurar correctamente `key_name` en Terraform  
- Tener la llave `.pem` en `~/.ssh/` o ruta accesible por WSL  
- Security Group debe permitir puerto 22 (SSH) y 80 (HTTP)

---

## Problemas comunes (lecciones aprendidas)

- Permisos incorrectos en la llave SSH (`chmod 400`)  
- Uso de `/mnt/c` en WSL causando problemas de permisos  

---

## Objetivo del proyecto

Aprender e integrar:

- Infraestructura como Código (Terraform)
- Automatización de configuración (Ansible)
- Contenedores (Docker)
- Despliegue en la nube (AWS)

---

## Autor: Alejandro Maldonado

Proyecto realizado como práctica DevOps - CloudForge
