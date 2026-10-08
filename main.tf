# resource "random_password" "classic" {
#   length = 16
# }

ephemeral "random_password" "eph" {
  length = 16
}

variable "token" {
    type = string
    ephemeral = true
}

moved {
  from = random_pet.server
  to = random_pet.app
}

removed {
  from = random_password.classic

  lifecycle {
    destroy = false
  }
}