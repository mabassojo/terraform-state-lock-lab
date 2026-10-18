resource "terraform_data" "application_a" {

  input = {
    application = "Application A"
  }

  provisioner "local-exec" {
    command = "echo 'Deploying Application A...' && sleep 120"
  }
}