resource "aws_sns_topic" "event_topic" {
  name = var.sns_topic_name
}
