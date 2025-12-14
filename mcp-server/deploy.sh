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

  terraform init || {
    echo "Terraform initialization failed!"
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
