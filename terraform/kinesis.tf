resource "aws_kinesis_stream" "event_stream" {
  name        = var.kinesis_stream_name
  shard_count = var.kinesis_shard_count
}
