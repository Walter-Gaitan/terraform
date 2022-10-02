output "hello_base_url" {
  value = aws_apigatewayv2_stage.dev.invoke_url
}

output "goodbye_url" {
  value = "https://${aws_apigatewayv2_stage.dev.invoke_url}/${aws_lambda_function.goodbye.function_name}"
}

output "test_goodbye_bucket" {
  value = random_pet.test_bucket_name.id
}