#!/bin/bash

AWS_ACCOUNT_ID=`aws sts get-caller-identity --query Account --output text`
AWS_REGION=`aws configure get region`
AWS_ECR_URL="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

IMAGE_NAME="spring-ai-mcp-server:latest"

AWS_ECR_IMAGE_NAME="${AWS_ECR_URL}/${IMAGE_NAME}"

docker tag ${IMAGE_NAME} ${AWS_ECR_IMAGE_NAME}
docker push ${AWS_ECR_IMAGE_NAME}
