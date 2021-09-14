# AWS IAM User

[![Lint Status](https://github.com/Flaconi/terraform-aws-iam-user/actions/workflows/linting.yml/badge.svg?branch=master)](https://github.com/Flaconi/terraform-aws-iam-user/actions/workflows/linting.yml)
[![Docs Status](https://github.com/Flaconi/terraform-aws-iam-user/actions/workflows/terraform-docs.yml/badge.svg?branch=master)](https://github.com/Flaconi/terraform-aws-iam-user/actions/workflows/terraform-docs.yml)
[![Tag](https://img.shields.io/github/tag/Flaconi/terraform-aws-iam-user.svg)](https://github.com/Flaconi/terraform-aws-iam-user/releases)
[![license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

Terraform module that provides an IAM User and optionally attaches it to inline defined policies, custom created policies and/or existing policiy ARN's

## Examples

Check the [examples](examples) directory.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 3 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the IAM user | `string` | n/a | yes |
| attach\_policy\_arns | Existing policy ARNs to attach to the IAM user | `list(string)` | `[]` | no |
| custom\_policies | Custom policies to create and attach to the IAM user | <pre>list(object({<br>    name = string<br>    statements = list(object({<br>      actions   = list(string)<br>      resources = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| inline\_policies | Inline defined policies to attach to the IAM user | <pre>list(object({<br>    name = string<br>    statements = list(object({<br>      actions   = list(string)<br>      resources = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
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

## License

[MIT](LICENSE)

Copyright (c) 2019 [Flaconi GmbH](https://github.com/Flaconi)
