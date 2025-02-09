resource "aws_sqs_queue" "event_queue" {
  name = var.sqs_queue_name
}

# Create a policy that allows SNS to send messages to the SQS queue
data "aws_iam_policy_document" "sqs_policy" {
  statement {
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.event_queue.arn]

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.event_topic.arn]
    }
  }
}

resource "aws_sqs_queue_policy" "event_queue_policy" {
  queue_url = aws_sqs_queue.event_queue.id
  policy    = data.aws_iam_policy_document.sqs_policy.json
}

resource "aws_sns_topic_subscription" "sns_to_sqs" {
  topic_arn = aws_sns_topic.event_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.event_queue.arn
}
