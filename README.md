# GCP Org Policies & Guardrails

This repository acts as the central "Source of Truth" for security constraints across the GCP Organization. I use Terraform to manage these policies.

## Authentication

This project uses **Workload Identity Federation** with GitHub Actions for keyless authentication to GCP. No service account keys are stored or used.

## What's being enforced?

Currently, I have some rules, but will be adding more rules not only to be secure but also to save money using cheapest cloud resources.

| Policy | Constraint | What it does |
| :--- | :--- | :--- |
| **No Public Buckets** | `storage.publicAccessPrevention` | Forces `enforced` on all buckets. Prevents accidental data leaks. |
| **No External IPs** | `compute.vmExternalIpAccess` | Blocks VMs from having public IPs. Use Cloud IAP or VPNs instead. |
| **Regional Lock** | `gcp.resourceLocations` | Limits resource deployment to `us-central1` and `us-east1`. |

### State Management
I use a GCS backend for state.
