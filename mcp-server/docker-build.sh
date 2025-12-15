#!/bin/bash

IMAGE_NAME="agentcore-spring-ai-mcp-server:latest"

docker buildx create --name container-builder --driver docker-container --bootstrap --use
docker buildx build --platform linux/arm64 -t ${IMAGE_NAME} --load .
