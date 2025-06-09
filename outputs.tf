# output.tf

# --- Salidas del módulo network ---
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "security_group_id" {
  description = "ID del grupo de seguridad"
  value       = module.network.security_group_id
}

# --- Salidas del módulo instances ---
output "mongodb_public_ip" {
  description = "IP pública de la instancia MongoDB"
  value       = module.instances.mongodb_public_ip
}

output "nodejs_public_ip" {
  description = "IP pública de la instancia Node.js"
  value       = module.instances.nodejs_public_ip
}

output "mongodb_private_ip" {
  description = "IP privada de la instancia MongoDB"
  value       = module.instances.mongodb_private_ip
}

output "nodejs_private_ip" {
  description = "IP privada de la instancia Node.js"
  value       = module.instances.nodejs_private_ip
}

# --- Salidas del módulo loadbalancer ---
output "lb_dns_name" {
  description = "DNS del balanceador de carga"
  value       = module.loadbalancer.lb_dns_name
}
