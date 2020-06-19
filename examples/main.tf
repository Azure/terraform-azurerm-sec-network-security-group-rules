module "rules" {
  source = "../"
}

output "rule_names" {
  value = module.rules.names
}

output "rule_configurations" {
  value = module.rules.configurations
}

output "deny_internet_inbound" {
  value = module.rules.deny_internet_inbound
}

output "deny_internet_outbound" {
  value = module.rules.deny_internet_outbound
}

