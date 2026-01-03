output "workload_identity_provider" {
  description = "Workload Identity Provider name for GitHub Actions"
  value       = module.workload_identity.workload_identity_provider_id
}

output "service_account_email" {
  description = "Service account email for GitHub Actions"
  value       = module.iam.service_account_email
}
