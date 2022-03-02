data "local_file" "cloudformation_template" {
  filename = "${path.module}/template.yaml"
}

resource "aws_cloudformation_stack" "chatbot_slack_configuration" {
  name = "chatbot-slack-configuration-${var.application_name}"

  template_body = data.local_file.cloudformation_template.content

  parameters = {
    ConfigurationNameParameter = "${var.application_name}-${var.environment}"
    IamRoleArnParameter        = aws_iam_role.this.arn
    LoggingLevelParameter      = var.logging_level
    SlackChannelIdParameter    = var.slack_channel_id
    SlackWorkspaceIdParameter  = var.slack_workspace_id
    SnsTopicArnsParameter      = join(",", [aws_sns_topic.alert.arn, aws_sns_topic.okay.arn])
    GuardrailPoliciesParameter = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    UserRoleRequiredParameter = false

  }

  tags = var.tags
}

resource "aws_iam_role" "this" {
  name               = "${var.application_name}-${var.environment}-chatbot"
  assume_role_policy = data.aws_iam_policy_document.chatbot.json

}

data "aws_iam_policy_document" "chatbot" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["chatbot.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.this.name
}


resource "aws_iam_policy" "this" {
  name   = "${var.application_name}-chatbot-${var.environment}-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.this.json
}


data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_sns_topic" "alert" {
  name = "${var.application_name}-${var.environment}-alert-topic"
}

resource "aws_sns_topic" "okay" {
  name = "${var.application_name}-${var.environment}-okay-topic"
}

