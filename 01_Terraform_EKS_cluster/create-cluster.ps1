#Requires -Version 5.1

$ErrorActionPreference = "Stop"

Write-Host "==============================="
Write-Host "STEP-1: Create VPC using Terraform"
Write-Host "==============================="
Set-Location "01_VPC_terraform-manifests"
terraform init
terraform apply -auto-approve

Write-Host ""
Write-Host "==============================="
Write-Host "STEP-2: Create EKS Cluster using Terraform"
Write-Host "==============================="
Set-Location "../02_EKS_terraform-manifests"
terraform init
terraform apply -var-file="environments/dev.tfvars" -auto-approve

Write-Host ""
Write-Host "✅ EKS Cluster and VPC creation completed successfully!"