(
  cd deployment || {
    echo "Deployment directory not found!"
    exit 1
  }

  export TF_VAR_aws_region=`aws configure get region`

  terraform destroy -auto-approve || {
    echo "Terraform destroy failed!"
    exit 1
  }

  echo "Destroy completed successfully."
)
