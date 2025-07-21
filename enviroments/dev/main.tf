##bucket
module "terraform_backend" {
  source        = "../../modules/storage/aws/s3"
  bucket        = "bucket.terraform.state"
  force_destroy = true
  region        = var.aws_region
  tags = {
    "IAC" = "True"
  }
}

#auth
module "open_id_connect_github_action" {
  source         = "../../modules/authentication/aws/open.id.connect"
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}

data "aws_iam_policy_document" "policy_document_terraform" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [module.open_id_connect_github_action.arn]
    }

    condition {
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "token.actions.githubusercontent.com:aud"
    }

    condition {
      test = "StringLike"
      values = [
        "repo:MatheusDonadoni2/devops.rockeseat.challanger.ci.cd.iac:ref:refs/heads/main",
        "repo:MatheusDonadoni2/devops.rockeseat.challanger.ci.cd.iac:ref:refs/heads/dev"
      ]
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}

module "role_terraform" {
  source             = "../../modules/authentication/aws/aws.iam.role"
  name               = "terraform.role"
  assume_role_policy = data.aws_iam_policy_document.policy_document_terraform.json
}

resource "aws_iam_role_policy" "terraform_policies" {
  name = "terraform.policies"
  role = module.role_terraform.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "ecr:*"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action : "iam:*",
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action : "s3:*",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

#container registry
module "container_registry" {
  source = "../../modules/container.registry/aws/ecr"
  name   = "${var.service_name}.container.registry.${var.enviroment}"
  tags = {
    "IAC" = "True"
  }
}