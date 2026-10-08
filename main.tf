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

# __generated__ by Terraform from "Zaher2026"
resource "random_string" "imported" {
  keepers          = null
  length           = 9
  lower            = true
  min_lower        = 0
  min_numeric      = 0
  min_special      = 0
  min_upper        = 0
  numeric          = true
  override_special = null
  special          = true
  upper            = true
}

resource "local_file" "implicite" {
  filename = "nom.txt"
  content = random_pet.app.id
}

resource "local_file" "explicite" {
  filename = "deploy.txt" 
  content = "deploy"
  depends_on = [random_pet.app] 
}