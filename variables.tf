variable "project_id" {
  description = "GCP Project ID for provider configuration"
  type        = string
}

variable "organization_id" {
  description = "GCP Organization ID where policies will be applied"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository in format 'owner/repo'"
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or username"
  type        = string
}
