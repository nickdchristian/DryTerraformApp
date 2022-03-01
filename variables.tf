variable "application_name" {
  default = "dryterraformapp"
  description = "Name of the application"
  type    = string
}

variable "domain_name" {
  default = "dryterraformapp"
  description = "The DNS name of the website, such as example.com"
  type    = string
}

variable "environment" {
  description = "The environment where the application is running in"
  type    = string
}
variable "files_bucket_name" {
  description = "Name of the bucket where files are stored"
  type    = string
}
variable "files_table_name" {
  description = "Name of the table where the record of files are stored"
  type    = string
}
variable "slack_channel_id" {
  description = "The ID of the Slack channel. To get the ID, open Slack, right click on the channel name in the left pane, then choose Copy Link. The channel ID is the 9-character string at the end of the URL. For example, ABCBBLZZZ."
}

variable "slack_workspace_id" {
  description = "The ID of the Slack workspace authorized with AWS Chatbot. To get the workspace ID, you must perform the initial authorization flow with Slack in the AWS Chatbot console. Then you can copy and paste the workspace ID from the console. For more details, see steps 1-4 in [Setting Up AWS Chatbot with Slack](https://docs.aws.amazon.com/chatbot/latest/adminguide/setting-up.html#Setup_intro) in the AWS Chatbot User Guide."
}