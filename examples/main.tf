module "rules" {
  source = "../"
}

output "deny_internet_inbound" {
  value = module.rules.deny_internet_inbound
}

output "deny_internet_outbound" {
  value = module.rules.deny_internet_outbound
}