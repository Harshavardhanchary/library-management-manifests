#!/bin/bash

BUILD_NUMBER=${BUILD_NUMBER:-$1}
FILE="database/deploy.yaml"
IMAGE_NAME="harshavardhan303/library-manager-db"

if [ -z "$BUILD_NUMBER" ]; then
  echo "❌ Error: No build number provided."
  exit 1
fi

sed -i "s|image: ${IMAGE_NAME}:.*|image: ${IMAGE_NAME}:${BUILD_NUMBER}|" "$FILE"
echo "✅ Updated ${FILE} with image tag: ${IMAGE_NAME}:${BUILD_NUMBER}"

