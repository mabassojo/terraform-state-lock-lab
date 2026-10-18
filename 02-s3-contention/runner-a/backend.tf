terraform {

  backend "s3" {
    bucket = "my-unique-terraform-lock-lab"
    key = "labs/state-lock/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}