# Organization-level IAM bindings
resource "google_organization_iam_member" "org_policy_admin" {
  org_id = var.organization_id
  role   = "roles/orgpolicy.policyAdmin"
  member = "serviceAccount:${google_service_account.service_accounts.email}"
}

resource "google_organization_iam_member" "org_viewer" {
  org_id = var.organization_id
  role   = "roles/viewer"
  member = "serviceAccount:${google_service_account.service_accounts.email}"
}

resource "google_organization_iam_member" "org_iam_viewer" {
  org_id = var.organization_id
  role   = "roles/resourcemanager.organizationViewer"
  member = "serviceAccount:${google_service_account.service_accounts.email}"
}

