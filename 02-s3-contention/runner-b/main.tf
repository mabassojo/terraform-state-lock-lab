resource "terraform_data" "slow_operation" {

  provisioner "local-exec" {
    command = "echo 'Simulating a long-running deployment...'&& sleep 120"
  }
}