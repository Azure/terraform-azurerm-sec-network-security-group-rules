output "deny_internet_inbound" {
  value = local.predefined_rules.DenyInternetInBound
}

output "deny_internet_outbound" {
  value = local.predefined_rules.DenyInternetOutBound
}