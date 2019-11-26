## KMS Key.

The following resources will be created:

 * Customer managed KMS Key.
 * Key alias.

## Dependencies and Prerequisites
 * Terraform v0.12+ or higher
 * AWS account

## Variables
| Variable | Default | Meaning |
| :------- | :----- | :----- |
| `create`| Default: true | Whether to create the Key and alias or not |
| `description` || Key description |
| `alias_name` || Alias name for the key. |  
| `deletion_window_in_days` | 21 | Duration in days after which the key is permenently deleted |
| `enable_key_rotation` | true| Enable yearly automatic key rotation  |
| `policy` | | JSON access policy for the key  |
| `tags` | | Mapping of additional tags |

## Outputs
 * key

## Usage
 * Use to create a customer managed KMS Key & alias. 
 * **N.B.** 
   Note regarding KMS policy:-
   If no policy is set AWS will usually assign a default policy to the key, granting access for the account root. In this case terraform will want to replace this policy each time it runs, therefore it's preferential to manage the policy directly within Terraform, as below.

To import the module add the following to the environment's TF file:
```
module "vpc" {
  source = "git::https://github.com/Cloud-42/terraform-aws-kms.git"
  
  description = "My key alias"
  alias_name  = "mykeyalias"
  policy = <<POLICY
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
```
* To initialise the module run: terraform init
* To update the module run    : terraform get --update
* To see a plan of changes    : terraform plan
* To apply                    : terraform apply 

