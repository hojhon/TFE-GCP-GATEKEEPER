module "org_constraints" {
  source = "./org-policy-constraints"
  organization_id = var.organization_id
}
module "iam" {
  source = "./iam"
  organization_id = var.organization_id
  project_id = var.project_id
}
module "workload_identity" {
  source = "./workload-identity"
  project_id = var.project_id
  service_account_id = module.iam.service_account_name
  github_repository = var.github_repository
  github_owner = var.github_owner
}