resource "terraform_data" "slow_operation" {

  triggers_replace = [
    timestamp()
  ]

  provisioner "local-exec" {
    command = "echo 'Terraform is now holding the remote state lock...' && sleep 300"
  }
}