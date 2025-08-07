#!/bin/bash

# --------------------------
# Script: update-database-yaml.sh
# Purpose: Update the image tag in database/deploy.yaml
# Usage: ./update-database-yaml.sh <build-number>
# --------------------------

# Input: Build number from CI/CD or manual input
BUILD_NUMBER=${BUILD_NUMBER:-$1}

if [ -z "$BUILD_NUMBER" ]; then
  echo "❌ Error: No build number provided."
  echo "Usage: $0 <build-number> or export BUILD_NUMBER"
  exit 1
fi

# Path to the deployment YAML
DEPLOY_FILE="database/deploy.yaml"

# Image name (corrected name: library-manager-db)
IMAGE_NAME="harshavardhan303/library-manager-db"

# Update the image line with the new tag
sed -i "s|image: ${IMAGE_NAME}:.*|image: ${IMAGE_NAME}:${BUILD_NUMBER}|" "$DEPLOY_FILE"

echo "✅ Updated ${DEPLOY_FILE} with image tag: ${IMAGE_NAME}:${BUILD_NUMBER}"

