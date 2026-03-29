#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$0")

echo "==============================="
echo "STEP-1: Destroy EKS Cluster"
echo "==============================="
cd "$SCRIPT_DIR/02_EKS_terraform_manifests"
terraform destroy -var-file="environments/dev.tfvars" -auto-approve

echo
echo "🧹 Cleaning up local Terraform cache..."
rm -rf .terraform .terraform.lock.hcl

echo
echo "==============================="
echo "STEP-2: Destroy VPC"
echo "==============================="
cd "$SCRIPT_DIR/01_VPC_terraform_manifests"
terraform destroy -auto-approve

echo
echo "🧹 Cleaning up local Terraform cache..."
rm -rf .terraform .terraform.lock.hcl

echo
echo "✅ EKS Cluster and VPC destroyed and cleaned up successfully!"