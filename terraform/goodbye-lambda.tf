resource "aws_iam_role" "goodbye_lambda_exec" {
  name = "goodbye-lambda"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "goodbye_lambda_policy" {
  role       = aws_iam_role.goodbye_lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "test_goodbye_bucket_access" {
  name = "TestgoodbyeBucketAccess"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "goodbye:GetObject",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:goodbye:::${aws_s3_bucket.test.id}/*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "goodbye_lambda_test_goodbye_bucket_access" {
  role       = aws_iam_role.goodbye_lambda_exec.name
  policy_arn = aws_iam_policy.test_goodbye_bucket_access.arn
}

resource "aws_lambda_function" "goodbye" {
  function_name = "goodbye"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_goodbye.key

  runtime = "nodejs16.x"
  handler = "function.handler"

  source_code_hash = data.archive_file.lambda_goodbye.output_base64sha256

  role = aws_iam_role.goodbye_lambda_exec.arn
}

resource "aws_cloudwatch_log_group" "goodbye" {
  name = "/aws/lambda/${aws_lambda_function.goodbye.function_name}"

  retention_in_days = 14
}

data "archive_file" "lambda_goodbye" {
  type = "zip"

  source_dir  = "../goodbye"
  output_path = "../goodbye.zip"
}

resource "aws_s3_object" "lambda_goodbye" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "goodbye.zip"
  source = data.archive_file.lambda_goodbye.output_path

  source_hash = filemd5(data.archive_file.lambda_goodbye.output_path)
}