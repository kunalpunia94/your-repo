#!/bin/bash

echo "Running Integration Tests..."

# Run the container
docker run -d -p 8080:80 --name test-container my-html-app
sleep 5  # Wait for Nginx to start

# Check if the HTML page is served correctly
curl -s http://localhost:8080 | grep "Hello from Docker"
if [ $? -ne 0 ]; then
    echo "❌ Integration test failed! HTML page is not served."
    docker stop test-container && docker rm test-container
    exit 1
fi

echo "✅ Integration test passed!"
docker stop test-container && docker rm test-container
