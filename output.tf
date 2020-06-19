output "names"{
  value = local.rule_names
}

output "configurations" {
  value = local.rule_configurations
}

output "deny_internet_inbound" {
  value = local.rule_configurations.DenyInternetInBound
}

output "deny_internet_outbound" {
  value = local.rule_configurations.DenyInternetOutBound
}