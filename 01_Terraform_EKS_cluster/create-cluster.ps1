#Requires -Version 5.1

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "==============================="
Write-Host "STEP-1: Create VPC using Terraform"
Write-Host "==============================="
Set-Location "$ScriptDir\01_VPC_terraform_manifests"
terraform init
terraform apply -auto-approve

Write-Host ""
Write-Host "==============================="
Write-Host "STEP-2: Create EKS Cluster using Terraform"
Write-Host "==============================="
Set-Location "$ScriptDir\02_EKS_terraform_manifests"
terraform init
terraform apply -var-file="environments/dev.tfvars" -auto-approve

Write-Host ""
Write-Host "✅ EKS Cluster and VPC creation completed successfully!"