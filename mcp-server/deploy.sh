(
  mvn clean install || {
    echo "Maven build failed!"
    exit 1
  }

  ./docker-build.sh || {
    echo "Docker build failed!"
    exit 1
  }

  cd deployment || {
    echo "Deployment directory not found!"
    exit 1
  }

  export TF_VAR_aws_region=`aws configure get region`

  terraform init || {
    echo "Terraform initialization failed!"
    exit 1
  }

  terraform validate || {
    echo "Terraform validation failed!"
    exit 1
  }

  terraform plan || {
    echo "Terraform planning failed!"
    exit 1
  }

  terraform apply -auto-approve || {
    echo "Terraform apply failed!"
    exit 1
  }

  echo "Deployment completed successfully."
)
