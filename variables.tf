variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "proyecto" {
  description = "Nombre del proyecto (prefijo de recursos)"
  type        = string
  default     = "cloudforge"
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_publica_cidr" {
  description = "CIDR de la subnet pública"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_privada_cidr" {
  description = "CIDR de la subnet privada"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 (mantener en Free Tier)"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Solo se permiten tipos Free Tier (t2.micro / t3.micro)."
  }
}

variable "key_name" {
  description = "Nombre del key pair existente para SSH"
  type        = string
}

variable "mi_ip_ssh" {
  description = "CIDR de tu IP para acceso SSH (ej. 181.199.46.128/32)"
  type        = string
}

variable "sufijo_unico" {
  description = "Sufijo único global para el bucket S3"
  type        = string
}