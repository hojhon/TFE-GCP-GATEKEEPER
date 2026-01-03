output "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  value       = google_iam_workload_identity_pool.pool.name
}

output "workload_identity_provider_id" {
  description = "Workload Identity Provider ID"
  value       = google_iam_workload_identity_pool_provider.github.name
}

output "provider_name" {
  description = "Provider name for GitHub Actions configuration"
  value       = google_iam_workload_identity_pool_provider.github.name
}
