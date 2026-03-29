#Requires -Version 5.1

$ErrorActionPreference = "Stop"

Write-Host "==============================="
Write-Host "STEP-1: Destroy EKS Cluster"
Write-Host "==============================="
Set-Location "02_EKS_terraform-manifests"
terraform destroy -var-file="environments/dev.tfvars" -auto-approve

Write-Host ""
Write-Host "🧹 Cleaning up local Terraform cache..."
Remove-Item -Recurse -Force .terraform, .terraform.lock.hcl

Write-Host ""
Write-Host "==============================="
Write-Host "STEP-2: Destroy VPC"
Write-Host "==============================="
Set-Location "../01_VPC_terraform-manifests"
terraform destroy -auto-approve

Write-Host ""
Write-Host "🧹 Cleaning up local Terraform cache..."
Remove-Item -Recurse -Force .terraform, .terraform.lock.hcl

Write-Host ""
Write-Host "✅ EKS Cluster and VPC destroyed and cleaned up successfully!"