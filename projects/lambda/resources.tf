data "archive_file" lambda {
  source_dir = "python/src"
  output_path = "asdfasdfasdf.zip"
  type        = "zip"
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${aws_lambda_function.asdf-2.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_function" "asdf-2" {
  function_name = "asdf-2"
  role          = aws_iam_role.for_lambda.arn
  handler = "abcde.xyz"
  filename = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime = "python3.9"
  environment {variables = {hello = "there"}}

}

data "aws_iam_policy" "aws_lambda_basic_execution_role" {
  name = "AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role" "for_lambda" {
  name_prefix = "dec-28-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [data.aws_iam_policy.aws_lambda_basic_execution_role.arn]
}