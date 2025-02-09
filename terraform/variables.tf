variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
  default     = "event-notifications-topic"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
  default     = "event-processing-queue"
}

variable "kinesis_stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
  default     = "event-stream"
}

variable "kinesis_shard_count" {
  description = "Number of shards for the Kinesis stream"
  type        = number
  default     = 1
}

# (Optional) Variables for Lambda Function
variable "lambda_function_name" {
  description = "Name of the Lambda function for processing Kinesis events"
  type        = string
  default     = "event-processor-function"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  type        = string
  default     = "event_processor.lambda_handler"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for the Lambda function (must be created manually with appropriate permissions)"
  type        = string
}
