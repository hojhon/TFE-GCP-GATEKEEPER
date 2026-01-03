# Organization Policy Constraints
# module "org_constraints" {
#   source = "./org-policy-constraints"
#   organization_id = var.organization_id
# }

# Workload Identity for GitHub Actions  
module "workload_identity" {
  source             = "./workload-identity"
  project_id         = var.project_id
  service_account_id = "projects/${var.project_id}/serviceAccounts/tfe-gatekeeper@${var.project_id}.iam.gserviceaccount.com"
  github_repository  = var.github_repository
  github_owner       = var.github_owner
}