output "vpc_name" {
  description = "VPC name"
  value       = module.network.network_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.network_id
}

output "private_subnet_name" {
  description = "Private subnet name"
  value       = module.network.private_subnet_name
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = module.network.private_subnet_id
}

output "router_name" {
  value = module.network.router_name
}

output "cloudsql_instance_name" {
  value = module.cloudsql.instance_name
}

output "cloudsql_database_name" {
  value = module.cloudsql.database_name
}

output "cloudsql_connection_name" {
  value = module.cloudsql.connection_name
}

output "private_ip_address" {
  value = module.cloudsql.private_ip_address
}