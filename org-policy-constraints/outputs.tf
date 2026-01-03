output "restrict_vm_external_ips_id" {
  description = "ID of the VM external IP restriction policy"
  value       = google_organization_policy.restrict_vm_external_ips.id
}

output "restrict_resource_locations_id" {
  description = "ID of the resource location restriction policy"
  value       = google_organization_policy.restrict_resource_locations.id
}

output "bucket_public_access_prevention_id" {
  description = "ID of the bucket public access prevention policy"
  value       = google_organization_policy.bucket_public_access_prevention.id
}
