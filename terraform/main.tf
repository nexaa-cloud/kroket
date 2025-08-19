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
  image     = "nginx:latest"

  resources = {
    cpu = 0.25
    ram = 0.5
  }

  ports = ["80:80"]

  ingresses = [
    {
      domain_name = null
      port        = 80
      tls         = true
    }
  ]

  health_check = {
    port = 80
    path = "/"
  }

  scaling = {
    type = "manual"
  }
}
