module "api" {
  source = "./api"

  application_name = var.application_name
  domain_name      = var.domain_name
  environment      = var.environment
  sns_alert_topic_arn = module.notifications.sns_alert_topic_arn
}

module "notifications" {
  source = "./notifications"

  application_name = var.application_name
  environment      = var.environment
  slack_channel_id = var.slack_channel_id
  slack_workspace_id = var.slack_workspace_id
}