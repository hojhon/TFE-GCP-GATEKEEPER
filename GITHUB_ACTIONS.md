# GitHub Actions Setup Guide

## Quick Setup

### 1. Configure GitHub Secrets

Go to your repository: **Settings → Secrets and variables → Actions → New repository secret**

Add these three secrets:

| Secret Name | Value | How to Get It |
|-------------|-------|---------------|
| `GCP_CREDENTIALS` | Full JSON key file | Create service account key (see below) |
| `GCP_PROJECT_ID` | `project-6d97eef3-4f34-478d-9c9` | Your GCP project ID |
| `GCP_ORGANIZATION_ID` | `123456789012` | Your GCP organization ID |
| `GCS_BUCKET` | `terraform-state-project-6d97eef3-4f34-478d-9c9` | State bucket name |
| `GCS_PREFIX` | `gcp-org-policies/state` | State file prefix/path |

### 2. Create Service Account

```bash
export PROJECT_ID="project-6d97eef3-4f34-478d-9c9"
export ORG_ID="your-org-id"

# Create service account
gcloud iam service-accounts create github-actions-terraform \
  --display-name="GitHub Actions Terraform" \
  --project=${PROJECT_ID}

# Grant organization policy admin role
gcloud organizations add-iam-policy-binding ${ORG_ID} \
  --member="serviceAccount:github-actions-terraform@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role="roles/orgpolicy.policyAdmin"

# Grant storage admin for state bucket
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member="serviceAccount:github-actions-terraform@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role="roles/storage.admin"

# Create and download key
gcloud iam service-accounts keys create github-actions-key.json \
  --iam-account=github-actions-terraform@${PROJECT_ID}.iam.gserviceaccount.com

# Copy the entire contents of this file to GCP_CREDENTIALS secret
cat github-actions-key.json

# Delete local file after copying (security best practice)
rm github-actions-key.json
```

### 3. Create GCS Bucket

```bash
# Create bucket
gcloud storage buckets create gs://terraform-state-${PROJECT_ID} \
  --project=${PROJECT_ID} \
  --location=us \
  --uniform-bucket-level-access

# Enable versioning
gcloud storage buckets update gs://terraform-state-${PROJECT_ID} \
  --versioning
```

## How It Works

### Workflow Triggers

The GitHub Actions workflow runs when:
- **Pull Request**: Any `.tf` file changes → Runs `terraform plan`
- **Push to main**: Merged PR → Runs `terraform apply`
- **Manual**: Click "Run workflow" in Actions tab

### Workflow Steps

1. ✅ Checkout code
2. ✅ Setup Terraform
3. ✅ Authenticate to GCP
4. ✅ Format check
5. ✅ Init & Validate
6. ✅ **PR**: Plan + comment on PR
7. ✅ **Main**: Apply policies

### Pull Request Workflow

1. Create a branch: `git checkout -b add-new-policy`
2. Make changes to `.tf` files
3. Commit and push: `git push origin add-new-policy`
4. Open Pull Request on GitHub
5. **GitHub Actions automatically runs `terraform plan`**
6. Review the plan in PR comments
7. Merge PR when ready
8. **GitHub Actions automatically runs `terraform apply`**

## Security Best Practices

✅ Service account has minimal required permissions  
✅ Credentials stored as GitHub encrypted secrets  
✅ No credentials in code repository  
✅ State file stored in GCS with versioning  
✅ All changes reviewed via PR before apply  

## Troubleshooting

### "Permission denied" in Actions
- Verify `GCP_CREDENTIALS` secret has full JSON key
- Check service account has `orgpolicy.policyAdmin` role
- Ensure service account has storage access to GCS bucket

### Plan shows "Error: Failed to get existing workspaces"
- Verify GCS bucket exists
- Check bucket name in `versions.tf` matches actual bucket
- Ensure service account has Storage Admin role

### Apply fails on main branch
- Check that secrets are properly set
- Verify organization ID is correct
- Review error logs in Actions tab

## Cost Considerations

- GitHub Actions minutes: ~2-5 minutes per run (free tier: 2000 min/month)
- GCS storage: ~$0.02/month for state file
- Service account: Free

**Estimated cost**: < $1/month
