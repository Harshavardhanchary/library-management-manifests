#!/bin/bash

# --------------------------
# Script: update-all-yaml.sh
# Purpose: Update image tags in backend and database deploy.yaml files
# Usage: ./update-all-yaml.sh <build-number>
# --------------------------

BUILD_NUMBER=${BUILD_NUMBER:-$1}

if [ -z "$BUILD_NUMBER" ]; then
  echo "❌ Error: No build number provided."
  echo "Usage: $0 <build-number> or export BUILD_NUMBER"
  exit 1
fi

# --- Backend ---
BACKEND_FILE="backend/deploy.yaml"
BACKEND_IMAGE="harshavardhan303/library-manager-backend"
sed -i "s|image: ${BACKEND_IMAGE}:.*|image: ${BACKEND_IMAGE}:${BUILD_NUMBER}|" "$BACKEND_FILE"
echo "✅ Updated backend image tag to :${BUILD_NUMBER}"

# --- Database ---
DATABASE_FILE="database/deploy.yaml"
DATABASE_IMAGE="harshavardhan303/library-manager-db"
sed -i "s|image: ${DATABASE_IMAGE}:.*|image: ${DATABASE_IMAGE}:${BUILD_NUMBER}|" "$DATABASE_FILE"
echo "✅ Updated database image tag to :${BUILD_NUMBER}"

