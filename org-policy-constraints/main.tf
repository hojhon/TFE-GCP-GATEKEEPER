# Organization Policy Constraints

# Restrict VM External IPs
resource "google_organization_policy" "restrict_vm_external_ips" {
  org_id     = var.organization_id
  constraint = "compute.vmExternalIpAccess"

  list_policy {
    deny {
      all = true
    }
  }
}

# Restrict Resource Locations central and east US
resource "google_organization_policy" "restrict_resource_locations" {
  org_id     = var.organization_id
  constraint = "gcp.resourceLocations"

  list_policy {
    allow {
      values = var.allowed_resource_locations
    }
  }
}

# Buckets not public
resource "google_organization_policy" "bucket_public_access_prevention" {
  org_id     = var.organization_id
  constraint = "storage.publicAccessPrevention"

  list_policy {
    allow {
      values = ["enforced"]
    }
  }
}
