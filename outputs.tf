output "iam_workload_identity_pools_id" {
  description = "Map of id values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no id are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iam_workload_identity_pools_attestation_rules" {
  description = "Map of attestation_rules values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no attestation_rules are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.attestation_rules if v.attestation_rules != null && length(v.attestation_rules) > 0 }
}
output "iam_workload_identity_pools_deletion_policy" {
  description = "Map of deletion_policy values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no deletion_policy are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "iam_workload_identity_pools_description" {
  description = "Map of description values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no description are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.description if v.description != null && length(v.description) > 0 }
}
output "iam_workload_identity_pools_disabled" {
  description = "Map of disabled values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no disabled are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.disabled if v.disabled != null }
}
output "iam_workload_identity_pools_display_name" {
  description = "Map of display_name values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no display_name are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "iam_workload_identity_pools_inline_certificate_issuance_config" {
  description = "Map of inline_certificate_issuance_config values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no inline_certificate_issuance_config are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => one(v.inline_certificate_issuance_config) if v.inline_certificate_issuance_config != null && length(v.inline_certificate_issuance_config) > 0 }
}
output "iam_workload_identity_pools_inline_trust_config" {
  description = "Map of inline_trust_config values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no inline_trust_config are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => one(v.inline_trust_config) if v.inline_trust_config != null && length(v.inline_trust_config) > 0 }
}
output "iam_workload_identity_pools_mode" {
  description = "Map of mode values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no mode are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.mode if v.mode != null && length(v.mode) > 0 }
}
output "iam_workload_identity_pools_name" {
  description = "Map of name values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no name are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "iam_workload_identity_pools_project" {
  description = "Map of project values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no project are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.project if v.project != null && length(v.project) > 0 }
}
output "iam_workload_identity_pools_state" {
  description = "Map of state values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no state are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.state if v.state != null && length(v.state) > 0 }
}
output "iam_workload_identity_pools_workload_identity_pool_id" {
  description = "Map of workload_identity_pool_id values across all iam_workload_identity_pools, keyed the same as var.iam_workload_identity_pools except keys with no workload_identity_pool_id are omitted"
  value       = { for k, v in google_iam_workload_identity_pool.iam_workload_identity_pools : k => v.workload_identity_pool_id if v.workload_identity_pool_id != null && length(v.workload_identity_pool_id) > 0 }
}

