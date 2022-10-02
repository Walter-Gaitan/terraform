
resource "aws_apigatewayv2_integration" "lambda_goodbye" {
  api_id = aws_apigatewayv2_api.main.id

  integration_uri    = aws_lambda_function.goodbye.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "post_goodbye" {
  api_id = aws_apigatewayv2_api.main.id

  route_key = "POST /goodbye"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_goodbye.id}"
}

resource "aws_lambda_permission" "api_gw_2" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.goodbye.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.main.execution_arn}/*/*"
}