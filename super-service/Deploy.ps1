#!/usr/bin/env pwsh

# Run tests
dotnet test ./test

# Build Docker image
docker build -t super-service .

# Run Docker container locally
docker run -d -p 8080:80 super-service

Write-Host "Deployment complete. The service is running on port 8080."


