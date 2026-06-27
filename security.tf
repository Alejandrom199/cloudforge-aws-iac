resource "aws_security_group" "web" {
  name        = "${var.proyecto}-web-sg"
  description = "Permite SSH restringido y HTTP publico"
  vpc_id      = aws_vpc.principal.id

  # SSH solo desde tu IP (menor privilegio)
  ingress {
    description = "SSH desde mi IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.mi_ip_ssh]
  }

  # HTTP abierto (es un servidor web publico)
  ingress {
    description = "HTTP publico"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.proyecto}-web-sg"
    ManagedBy = "Terraform"
  }
}