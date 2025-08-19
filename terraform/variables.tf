variable "nexaa_username" {
  description = "Username for Nexaa authentication"
  type        = string
  sensitive   = true
}

variable "nexaa_password" {
  description = "Password for Nexaa authentication"
  type        = string
  sensitive   = true
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "ghcr.io/nexaa-cloud/kroket:latest"
}
