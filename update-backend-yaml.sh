#!/bin/bash

BUILD_NUMBER=${BUILD_NUMBER:-$1}
if [ -z "$BUILD_NUMBER" ]; then
  echo "Usage: $0 <build-number> or set BUILD_NUMBER env variable"
  exit 1
fi

# Use sed to replace the tag with the new build number
sed -i "s|image: harshavardhan303/library-manager-backend:.*|image: harshavardhan303/library-manager-backend:${BUILD_NUMBER}|" backend/deploy.yaml

echo "✅ Updated backend image tag to :${BUILD_NUMBER}"

