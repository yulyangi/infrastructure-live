remote_state {
  backend = "local"
  generate = {
    path      = "s3"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    path     = "${path_relative_to_include()}/terraform.tfstate"
    role_arn = "arn:aws:iam::468617488226:role/yulyan-apply"
    bucket   = "yulyanglonti-terraform-state"

    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_lock_table"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
  region  = "us-east-1"

  assume_role {
    session_name = "session-yulyan"
    role_arn = "arn:aws:iam::468617488226:role/yulyan-apply" 
  }
}
EOF
}

