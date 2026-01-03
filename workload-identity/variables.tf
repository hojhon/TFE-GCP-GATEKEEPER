variable "project_id" {
  description = "GCP Project ID where workload identity resources will be created"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository in format 'owner/repo' (e.g., 'myorg/myrepo')"
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or username that owns the repository"
  type        = string
}
