run "nom_dev" {
  command = plan

  variables {
    env = "dev"
    token = "x"
  }

  assert {
    condition = random_pet.app.length == 2
    error_message = "En dev, length doit être 2."

  }
}

run "env_invalide" {
    command = plan

    variables {
      env = "test"
      token = "x"
    }

    expect_failures = [ var.env ]
}