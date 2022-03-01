variable "application_name" {
  default     = "dryterraformapp"
  description = "Name of the application"
  type        = string
}

variable "domain_name" {
  default     = "dryterraformapp"
  description = "The DNS name of the website, such as example.com"
  type        = string
}

variable "environment" {
  description = "The environment where the application is running in"
  type        = string
}
variable "sns_alert_topic_arn" {
  type = string
}