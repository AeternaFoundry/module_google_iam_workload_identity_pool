resource "google_iam_workload_identity_pool" "iam_workload_identity_pools" {
  for_each = var.iam_workload_identity_pools

  workload_identity_pool_id = each.value.workload_identity_pool_id
  deletion_policy           = each.value.deletion_policy
  description               = each.value.description
  disabled                  = each.value.disabled
  display_name              = each.value.display_name
  mode                      = each.value.mode
  project                   = each.value.project

  dynamic "attestation_rules" {
    for_each = each.value.attestation_rules != null ? each.value.attestation_rules : []
    content {
      google_cloud_resource = attestation_rules.value.google_cloud_resource
    }
  }

  dynamic "inline_certificate_issuance_config" {
    for_each = each.value.inline_certificate_issuance_config != null ? [each.value.inline_certificate_issuance_config] : []
    content {
      ca_pools                   = inline_certificate_issuance_config.value.ca_pools
      key_algorithm              = inline_certificate_issuance_config.value.key_algorithm
      lifetime                   = inline_certificate_issuance_config.value.lifetime
      rotation_window_percentage = inline_certificate_issuance_config.value.rotation_window_percentage
      use_default_shared_ca      = inline_certificate_issuance_config.value.use_default_shared_ca
    }
  }

  dynamic "inline_trust_config" {
    for_each = each.value.inline_trust_config != null ? [each.value.inline_trust_config] : []
    content {
      dynamic "additional_trust_bundles" {
        for_each = inline_trust_config.value.additional_trust_bundles != null ? inline_trust_config.value.additional_trust_bundles : []
        content {
          dynamic "trust_anchors" {
            for_each = additional_trust_bundles.value.trust_anchors
            content {
              pem_certificate = trust_anchors.value.pem_certificate
            }
          }
          trust_default_shared_ca = additional_trust_bundles.value.trust_default_shared_ca
          trust_domain            = additional_trust_bundles.value.trust_domain
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

