
terraform {
  required_version = ">= 1.4.0"
}

resource "terraform_data" "slow_operation" {
  triggers_replace = [
    timestamp()
  ]
  provisioner "local-exec" {
    command = "echo 'Holding Terraform operation open...' && sleep 120"
  }
}
