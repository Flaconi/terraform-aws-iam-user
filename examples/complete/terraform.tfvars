inline_policies = [
  {
    name = "s3-access"
    statements = [
      {
        actions   = ["s3:ListBucket"]
        resources = ["arn:aws:s3:::test"]
      },
      {
        actions   = ["s3:get*"]
        resources = ["arn:aws:s3:::test/*"]
      }
    ]
  },
  {
    name = "kinesis-full-access"
    statements = [
      {
        actions   = ["kinesis:*"]
        resources = ["*"]
      },
    ]
  }
]
