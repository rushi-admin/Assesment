output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_instance_ips" {
  value = module.servers.public_ips
}
output "private_instance_ips" {
  value = module.servers.private_ips
}
