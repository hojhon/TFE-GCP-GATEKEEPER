variable "organization_id" {
  description = "GCP Organization ID where policies will be applied"
  type        = string
}

variable "allowed_resource_locations" {
  description = "List of allowed resource locations"
  type        = list(string)
  default = [
    "in:us-central1-locations",
    "in:us-east1-locations",
    "in:us-east4-locations"
  ]
}
