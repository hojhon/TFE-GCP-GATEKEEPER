variable "project_id" {
  description = "GCP Project ID where IAM resources will be managed"
  type        = string
}

variable "organization_id" {
  description = "GCP Organization ID for organization-level IAM resources"
  type        = string
  default     = ""
}


