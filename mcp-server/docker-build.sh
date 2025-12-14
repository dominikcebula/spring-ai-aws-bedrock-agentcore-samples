#!/bin/bash

docker buildx create --name container-builder --driver docker-container --bootstrap --use
docker buildx build --platform linux/arm64 -t spring-ai-mcp-server:latest --load .
