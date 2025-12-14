(
  cd deployment || {
    echo "Deployment directory not found!"
    exit 1
  }

  terraform destroy || {
    echo "Terraform destroy failed!"
    exit 1
  }

  echo "Destroy completed successfully."
)
