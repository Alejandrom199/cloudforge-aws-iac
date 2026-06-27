data "aws_availability_zones" "disponibles" {
  state = "available"
}

# VPC principal
resource "aws_vpc" "principal" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name      = "${var.proyecto}-vpc"
    ManagedBy = "Terraform"
    Project   = var.proyecto
  }
}

# Internet Gateway
resource "aws_internet_gateway" "principal" {
  vpc_id = aws_vpc.principal.id

  tags = {
    Name      = "${var.proyecto}-igw"
    ManagedBy = "Terraform"
  }
}

# Subnet pública (para el cómputo)
resource "aws_subnet" "publica" {
  vpc_id                  = aws_vpc.principal.id
  cidr_block              = var.subnet_publica_cidr
  availability_zone       = data.aws_availability_zones.disponibles.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.proyecto}-subnet-publica"
    ManagedBy = "Terraform"
    Tier      = "public"
  }
}

# Subnet privada (reservada, demuestra el patrón)
resource "aws_subnet" "privada" {
  vpc_id            = aws_vpc.principal.id
  cidr_block        = var.subnet_privada_cidr
  availability_zone = data.aws_availability_zones.disponibles.names[1]

  tags = {
    Name      = "${var.proyecto}-subnet-privada"
    ManagedBy = "Terraform"
    Tier      = "private"
  }
}

# Route table pública (con ruta a internet)
resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.principal.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.principal.id
  }

  tags = {
    Name      = "${var.proyecto}-rt-publica"
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table_association" "publica" {
  subnet_id      = aws_subnet.publica.id
  route_table_id = aws_route_table.publica.id
}