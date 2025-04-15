remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "yduqs-ia-prd.tfstate"
    key    = "${get_env("TF_VAR_repo_name", "default-repo")}/terraform.tfstate"
    region = "us-east-1"
  }
}

terraform {
  source = "../"

  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "plan",
      "destroy",
      "import",
      "push",
      "refresh"
    ]

    required_var_files = [
      "./tfvars/prd.tfvars"
    ]
  }
}
