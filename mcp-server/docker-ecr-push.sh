#!/bin/bash

AWS_ACCOUNT_ID=`aws sts get-caller-identity --query Account --output text`
AWS_REGION=`aws configure get region`
AWS_ECR_URL="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

IMAGE_NAME="agentcore-spring-ai-mcp-server:latest"

AWS_ECR_IMAGE_NAME="${AWS_ECR_URL}/${IMAGE_NAME}"

aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ECR_URL}

docker tag ${IMAGE_NAME} ${AWS_ECR_IMAGE_NAME} || {
    echo "Docker tagging failed!"
    exit 1
}
docker push ${AWS_ECR_IMAGE_NAME} || {
    echo "Docker push to ECR failed!"
    exit 1
}
