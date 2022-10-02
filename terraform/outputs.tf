output "hello_base_url" {
  value = aws_apigatewayv2_stage.dev.invoke_url
}

output "s3_url" {
  value = "https://${aws_apigatewayv2_stage.dev.invoke_url}/${aws_lambda_function.s3.function_name}"
}

output "test_s3_bucket" {
  value = random_pet.test_bucket_name.id
}