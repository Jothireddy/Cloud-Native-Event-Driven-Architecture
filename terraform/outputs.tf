output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.event_topic.arn
}

output "sqs_queue_url" {
  description = "URL of the SQS queue"
  value       = aws_sqs_queue.event_queue.id
}

output "kinesis_stream_name" {
  description = "Name of the Kinesis stream"
  value       = aws_kinesis_stream.event_stream.name
}

# (Optional) Output the Lambda function ARN
output "lambda_function_arn" {
  description = "ARN of the event processor Lambda function"
  value       = aws_lambda_function.event_processor.arn
  condition   = length(var.lambda_role_arn) > 0
}
