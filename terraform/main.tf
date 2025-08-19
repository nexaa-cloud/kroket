terraform {
  required_version = ">= 1.0"
  required_providers {
    nexaa = {
      source = "nexaa-cloud/nexaa"
    }
  }
}

provider "nexaa" {
  username = var.nexaa_username
  password = var.nexaa_password
}

resource "nexaa_namespace" "kroket" {
  name        = "nexaa-kroket"
}

resource "nexaa_container" "container" {
  name      = "kroket-friday"
  namespace = nexaa_namespace.kroket.name
  image     = var.container_image

  resources = {
    cpu = 0.25
    ram = 0.5
  }

  ports = ["80:80"]

  ingresses = [
    {
      domain_name = "kroket.nexaa.io"
      port        = 80
      tls         = true
      allow_list = ["0.0.0.0/0"]
    }
  ]

  health_check = {
    port = 80
    path = "/"
  }

  scaling = {
    type = "manual"
    manual_input = 1
  }
}
