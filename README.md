## KMS Key.

The following resources will be created:

 * Customer managed KMS Key.
 * Key alias.

## Dependencies and Prerequisites
 * Terraform v0.12. or higher
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


To import the module add the following to the environment's TF file:
```
module "vpc" {
  source = "git::https://github.com/Cloud-42/terraform-aws-kms.git"
  
  description = "My key alias"
  alias_name  = "mykeyalias"

}
```
* To initialise the module run: terraform init
* To update the module run    : terraform get --update
* To see a plan of changes    : terraform plan
* To apply                    : terraform apply 

