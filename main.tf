resource "random_password" "classic" {
  length = 16
}

ephemeral "random_password" "eph" {
  length = 16
}

variable "token" {
    type = string
    ephemeral = true
}