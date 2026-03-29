#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$0")

echo "==============================="
echo "STEP-1: Create VPC using Terraform"
echo "==============================="
cd "$SCRIPT_DIR/01_VPC_terraform_manifests"
terraform init 
terraform apply -auto-approve

echo
echo "==============================="
echo "STEP-2: Create EKS Cluster using Terraform"
echo "==============================="
cd "$SCRIPT_DIR/02_EKS_terraform_manifests"
terraform init 
terraform apply -var-file="environments/dev.tfvars" -auto-approve

echo
echo "✅ EKS Cluster and VPC creation completed successfully!"