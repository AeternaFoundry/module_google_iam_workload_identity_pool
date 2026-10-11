variable "iam_workload_identity_pools" {
  description = <<EOT
Map of iam_workload_identity_pools, attributes below
Required:
    - workload_identity_pool_id
Optional:
    - deletion_policy
    - description
    - disabled
    - display_name
    - mode
    - project
    - attestation_rules (block):
        - google_cloud_resource (required)
    - inline_certificate_issuance_config (block):
        - ca_pools (optional)
        - key_algorithm (optional)
        - lifetime (optional)
        - rotation_window_percentage (optional)
        - use_default_shared_ca (optional)
    - inline_trust_config (block):
        - additional_trust_bundles (optional, block):
            - trust_anchors (required, block):
                - pem_certificate (required)
            - trust_default_shared_ca (optional)
            - trust_domain (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    workload_identity_pool_id = string
    deletion_policy           = optional(string)
    description               = optional(string)
    disabled                  = optional(bool)
    display_name              = optional(string)
    mode                      = optional(string)
    project                   = optional(string)
    attestation_rules = optional(list(object({
      google_cloud_resource = string
    })))
    inline_certificate_issuance_config = optional(object({
      ca_pools                   = optional(map(string))
      key_algorithm              = optional(string)
      lifetime                   = optional(string)
      rotation_window_percentage = optional(number)
      use_default_shared_ca      = optional(bool)
    }))
    inline_trust_config = optional(object({
      additional_trust_bundles = optional(list(object({
        trust_anchors = list(object({
          pem_certificate = string
        }))
        trust_default_shared_ca = optional(bool)
        trust_domain            = string
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.iam_workload_identity_pools : (
        v.inline_trust_config == null || (v.inline_trust_config.additional_trust_bundles == null || alltrue([for item in v.inline_trust_config.additional_trust_bundles : (length(item.trust_anchors) >= 1)]))
      )
    ])
    error_message = "Each trust_anchors list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_workload_identity_pools : (
        !startswith(v.workload_identity_pool_id, "gcp-")
      )
    ])
    error_message = "[from ValidateWorkloadIdentityPoolId: must not start with \"gcp-\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_workload_identity_pools : (
        length(v.workload_identity_pool_id) >= 4
      )
    ])
    error_message = "[from ValidateWorkloadIdentityPoolId: invalid when len(value) < 4]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_workload_identity_pools : (
        length(v.workload_identity_pool_id) <= 32
      )
    ])
    error_message = "[from ValidateWorkloadIdentityPoolId: invalid when len(value) > 32]"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

