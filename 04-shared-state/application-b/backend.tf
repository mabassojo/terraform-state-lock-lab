terraform {
  required_version = ">= 1.14.0"

  backend "s3" {
    bucket       = "my-unique-terraform-lock-lab"
    # INTENTIONALLY WRONG FOR THIS LAB
    key          = "labs/shared-state/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}