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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.this_custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.this_inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy_attachment.this_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.this_custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy_document.this_custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this_inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the IAM user | `string` | n/a | yes |
| <a name="input_attach_policy_arns"></a> [attach\_policy\_arns](#input\_attach\_policy\_arns) | Existing policy ARNs to attach to the IAM user | `list(string)` | `[]` | no |
| <a name="input_custom_policies"></a> [custom\_policies](#input\_custom\_policies) | Custom policies to create and attach to the IAM user | <pre>list(object({<br>    name = string<br>    statements = list(object({<br>      actions   = list(string)<br>      resources = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_inline_policies"></a> [inline\_policies](#input\_inline\_policies) | Inline defined policies to attach to the IAM user | <pre>list(object({<br>    name = string<br>    statements = list(object({<br>      actions   = list(string)<br>      resources = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of the IAM user | `string` | `"/"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_access_key_id"></a> [iam\_access\_key\_id](#output\_iam\_access\_key\_id) | The access key id |
| <a name="output_iam_access_key_secret"></a> [iam\_access\_key\_secret](#output\_iam\_access\_key\_secret) | The access key secret |
| <a name="output_iam_user_arn"></a> [iam\_user\_arn](#output\_iam\_user\_arn) | The IAM User ARN |
| <a name="output_iam_user_id"></a> [iam\_user\_id](#output\_iam\_user\_id) | The IAM User ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

[MIT](LICENSE)

Copyright (c) 2019 [Flaconi GmbH](https://github.com/Flaconi)
