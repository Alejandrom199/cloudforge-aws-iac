output "instancia_ip_publica" {
  description = "IP publica de la instancia web"
  value       = aws_instance.web.public_ip
}

output "instancia_dns" {
  description = "DNS publico de la instancia"
  value       = aws_instance.web.public_dns
}

output "url_web" {
  description = "URL para acceder a la aplicacion"
  value       = "http://${aws_instance.web.public_ip}"
}

output "bucket_assets" {
  description = "Nombre del bucket de assets"
  value       = aws_s3_bucket.assets.bucket
}

output "comando_ssh" {
  description = "Comando para conectarse por SSH"
  value       = "ssh -i ${var.key_name}.pem ec2-user@${aws_instance.web.public_ip}"
}