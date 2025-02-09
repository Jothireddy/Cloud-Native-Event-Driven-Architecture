resource "aws_lambda_function" "event_processor" {
  function_name = var.lambda_function_name
  filename      = "lambda/event_processor.zip"  # Package your Lambda code as a ZIP archive
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = var.lambda_role_arn
}

resource "aws_lambda_event_source_mapping" "kinesis_mapping" {
  event_source_arn  = aws_kinesis_stream.event_stream.arn
  function_name     = aws_lambda_function.event_processor.arn
  starting_position = "LATEST"
  batch_size        = 100
}
