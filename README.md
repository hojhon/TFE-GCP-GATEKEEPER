# GCP Org Policies & Guardrails

This repository acts as the central "Source of Truth" for security constraints across the GCP Organization. I use Terraform to manage these policies.

## What's being enforced?

Currently, I have some rules, but will be adding more rules not only to be secure but also to save money using cheapest items.

| Policy | Constraint | What it does |
| :--- | :--- | :--- |
| **No Public Buckets** | `storage.publicAccessPrevention` | Forces `enforced` on all buckets. Prevents accidental data leaks. |
| **No External IPs** | `compute.vmExternalIpAccess` | Blocks VMs from having public IPs. Use Cloud IAP or VPNs instead. |
| **Regional Lock** | `gcp.resourceLocations` | Limits resource deployment to `us-central1` and `us-east1`. |

## Project Structure

* `/org-policy-constraints`: The core module that handles the logic for boolean and list constraints.
* `main.tf`: Where I call the modules and define our specific organizational settings.
* `variables.tf`: Toggles for enabling/disabling specific rules.

## Getting Started

### Option 1: GitHub Actions (Recommended)

**Set up automated Terraform runs on every PR and merge:**

1. **Configure GitHub Secrets** (Settings → Secrets and variables → Actions):
   ```
   GCP_CREDENTIALS      = <paste entire JSON key file>
   GCP_PROJECT_ID       = project-6d97eef3-4f34-478d-9c9
   GCP_ORGANIZATION_ID  = <your-org-id>
   ```

2. **Push to GitHub**:
   ```bash
   git add .
   git commit -m "Initial setup with GitHub Actions"
   git push
   ```

3. **Workflow Behavior**:
   - **Pull Requests**: Automatically runs `terraform plan` and posts results as a comment
   - **Merge to main**: Automatically runs `terraform apply` to enforce policies
   - **Manual trigger**: Can run via GitHub Actions tab → "Run workflow"

### Option 2: Local Execution

**Run Terraform manually from your machine:**

### 1. State Management
I use a GCS backend for state.
