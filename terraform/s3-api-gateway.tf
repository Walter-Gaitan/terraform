
resource "aws_apigatewayv2_integration" "lambda_s3" {
  api_id = aws_apigatewayv2_api.main.id

  integration_uri    = aws_lambda_function.s3.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "post_s3" {
  api_id = aws_apigatewayv2_api.main.id

  route_key = "POST /s3"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_s3.id}"
}

resource "aws_lambda_permission" "api_gw_2" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.main.execution_arn}/*/*"
}