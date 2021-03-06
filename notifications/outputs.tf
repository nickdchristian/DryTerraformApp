output "stack_id" {
  description = "The unique identifier for the stack."
  value       = aws_cloudformation_stack.chatbot_slack_configuration.id
}

output "configuration_arn" {
  description = "The ARN of the Chatbot Slack configuration"
  value       = aws_cloudformation_stack.chatbot_slack_configuration.outputs.ConfigurationArn
}
output "sns_alert_topic_arn" {
  value = aws_sns_topic.alert.arn
}
output "sns_okay_topic_arn" {
  value = aws_sns_topic.okay.arn
}