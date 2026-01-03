# Service Accounts Configuration

resource "google_service_account" "service_accounts" {
  project      = var.project_id
  account_id   = "tfe-gatekeeper"
  display_name = "tfe-gatekeeper"
  description  = "service account for workload identity testing"
}
