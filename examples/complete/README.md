# Complete example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| name | Name of the IAM user | `any` | n/a | yes |
| attach\_policy\_arns | Existing policy ARNs to attach to the IAM user | `list(string)` | `[]` | no |
| custom\_policies | Custom policies to create and attach to the IAM user | `list` | `[]` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| inline\_policies | Inline defined policies to attach to the IAM user | `list` | `[]` | no |
| path | Path of the IAM user | `string` | `"/"` | no |
| tags | Tags applied to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_aws\_iam\_access\_key\_id | The access key id |
| this\_aws\_iam\_access\_key\_secret | The access key secret |
| this\_aws\_iam\_user\_arn | The IAM User ARN |
| this\_aws\_iam\_user\_id | The IAM User ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
