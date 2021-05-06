output "vpc_security_group_ids" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.security_group.security_group_id
}
