#!/bin/bash

echo "Running Unit Tests..."

# Try to build the Docker image
docker build -t my-html-app .
if [ $? -ne 0 ]; then
    echo "❌ Docker build failed!"
    exit 1
fi

echo "✅ Docker build successful!"
