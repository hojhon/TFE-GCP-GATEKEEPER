output "service_account_email" {
  description = "Service account email address"
  value       = google_service_account.service_accounts.email
}

output "service_account_name" {
  description = "Service account fully qualified name"
  value       = google_service_account.service_accounts.name
}

output "service_account_id" {
  description = "Service account unique ID"
  value       = google_service_account.service_accounts.unique_id
}


