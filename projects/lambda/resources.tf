data "archive_file" z {
  source_dir = "python/src"
  output_path = "python/build/package.zip"
  type = "zip"
}

data "aws_iam_policy" "p" {
  name = "AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role" "r" {
  name_prefix = "dec-28-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [data.aws_iam_policy.p.arn]
}

resource "aws_cloudwatch_log_group" "g" {
  name = "/aws/lambda/${aws_lambda_function.f.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_function" "f" {
  function_name = "example"
  role = aws_iam_role.r.arn
  handler = "abcde.xyz"
  filename = data.archive_file.z.output_path
  source_code_hash = data.archive_file.z.output_base64sha256
  runtime = "python3.9"
  environment { variables = { hello = "there" } }
}
