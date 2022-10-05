output "hello_url" {
  value = "${aws_apigatewayv2_stage.dev.invoke_url}/${aws_lambda_function.hello.function_name}"
}

output "goodbye_url" {
  value = "${aws_apigatewayv2_stage.dev.invoke_url}/${aws_lambda_function.goodbye.function_name}"
}