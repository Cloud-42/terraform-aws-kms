
<p align="center">
  <a href="https://www.cloud42.io/" target="_blank" rel="Homepage">
  <img width="200" height="200" src="https://www.cloud42.io/wp-content/uploads/2020/01/transparent_small.png">
  </a>
</p>

---

<p align="center">Need help with your Cloud builds <a href="https://www.cloud42.io/contact/" target="_blank" rel="ContactUS"> GET IN TOUCH</a>.</p>

---
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
| `create`| true | Whether to create the Key and alias or not |
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
 * Example usage: <a href="https://github.com/Cloud-42/terraform-aws-kms/blob/master/examples/main.tf" target="_blank" rel="Example">Example</a>

## Plan and apply
* To initialise the module run: terraform init
* To update the module run    : terraform get --update
* To see a plan of changes    : terraform plan
* To apply                    : terraform apply 
