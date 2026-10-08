variable "env" {
    type = string

    validation {
      condition = contains(["dev","prod"], var.env)
      error_message = "env doit etre dev ou prod"
    }
}

resource "random_pet" "app" {
    length = var.env == "prod" ? 3 : 2

    lifecycle {
        postcondition {
          condition = length(split("-", self.id)) >= 2
          error_message = "Le nom généré est trop court."
        }
    }
}

check "nom_prod" {
    assert {
        condition = var.env != "prod" || length(split("-", random_pet.app.id)) == 3
        error_message = "En prod, le nom devrait avoir trois mots."
    }
}