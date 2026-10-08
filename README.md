# tf-004-lab

Hands-on lab built while preparing the **HashiCorp Certified: Terraform Associate (004)** exam (Terraform 1.12).

It covers the features introduced or emphasized in the 004 objectives, using only the `random` and `local` providers. No cloud account and no credentials are required, so anyone can clone it and run it locally.

## What this lab demonstrates

| Topic | File | What it shows |
|---|---|---|
| Ephemeral values | `main.tf` | `ephemeral "random_password"` is opened on every run and never written to state or plan. `variable "token" { ephemeral = true }` is rejected by non write-only arguments. |
| Custom conditions | `conditions.tf` | `validation` on a variable, `postcondition` in `lifecycle`, and a standalone `check` block (warning only, does not block the apply). |
| Refactoring | `main.tf` | `moved` block renames `random_pet.server` to `random_pet.app` without destroying it (declarative `terraform state mv`). |
| Stop managing a resource | `main.tf` | `removed` block with `lifecycle { destroy = false }` (declarative `terraform state rm`). |
| Import | `import.tf`, `generated.tf` | `import` block + `terraform plan -generate-config-out=generated.tf` (config generation is experimental in 1.12). |
| Dependencies | `main.tf` | Implicit dependency via a reference vs explicit `depends_on`. |
| Native testing | `tests/main.tftest.hcl` | `terraform test` with `run`, `assert` and `expect_failures`. |

## Requirements

- Terraform `>= 1.12`
- No cloud provider account

## Usage

```bash
terraform init
terraform plan
terraform apply
terraform test
```

Variables are loaded automatically from `terraform.tfvars` (`env` must be `dev` or `prod`). The values in it are dummy values for the lab.

## Key takeaways

- `sensitive` hides a value in CLI output, but it is still stored in state. `ephemeral` prevents it from being stored at all.
- A replacement (`-/+`) is counted as 1 add + 1 destroy, never as a change.
- `check` blocks only produce warnings. `validation`, `precondition` and `postcondition` fail the run.
- The state file and `.terraform/` are never committed. `.terraform.lock.hcl` is committed.

## Author

Zaher Madi · [GitHub](https://github.com/ZaherMadi) · [LinkedIn](https://www.linkedin.com/in/zaher-madi-b78625184/)