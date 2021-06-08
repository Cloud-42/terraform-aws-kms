#
# The module is usually called from a 
# top level "control" repository.
#
module "kms" {
  source = "git::https://github.com/Cloud-42/terraform-aws-kms.git"

  description = "My CMK"
  alias_name  = "mykeyalias"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "1",
    "Statement": [
        {
            "Sid": "Account Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
POLICY
}
