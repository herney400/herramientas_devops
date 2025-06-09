# modules/instances/outputs.tf
output "mongodb_public_ip" {
  description = "IP pública de la instancia MongoDB"
  value       = aws_instance.mongodb_instance.public_ip
}

output "nodejs_public_ip" {
  description = "IP pública de la instancia Node.js"
  value       = aws_instance.nodejs_instance.public_ip
}

output "mongodb_private_ip" {
  description = "IP privada de la instancia MongoDB"
  value       = aws_instance.mongodb_instance.private_ip
}

output "nodejs_private_ip" {
  description = "IP privada de la instancia Node.js"
  value       = aws_instance.nodejs_instance.private_ip
}
output "nodejs_instance_id" {
  description = "ID de la instancia Node.js"
  value       = aws_instance.nodejs_instance.id
}
