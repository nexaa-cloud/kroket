terraform {
  required_version = ">= 1.0"
  required_providers {
    nexaa = {
      source  = "nexaa-cloud/nexaa"
      version = ">= 0.1.23"
    }
  }
}

provider "nexaa" {
  username = var.nexaa_username
  password = var.nexaa_password
}

# ===================================================================
# Data sources
# ===================================================================

data "nexaa_container_resources" "container_resource" {
  cpu = 0.25
  memory = 0.5
}

# ===================================================================
# Resources
# ===================================================================

resource "nexaa_namespace" "kroket" {
  name        = "nexaa-kroket"
}

resource "nexaa_container" "container" {
  name      = "kroket-friday"
  namespace = nexaa_namespace.kroket.name
  image     = var.container_image

  resources = data.nexaa_container_resources.container_resource.id

  ports = ["80:80"]

  ingresses = [
    {
      domain_name = "kroket.nexaa.io"
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
    manual_input = 1
  }
}
