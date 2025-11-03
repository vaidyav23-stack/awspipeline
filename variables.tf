variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "myapp"
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch"
  type        = string
  default     = "main"
}

variable "github_token_path" {
  description = "Parameter Store path for GitHub token"
  type        = string
  default     = "/github/token"
}

variable "sonar_host_url" {
  description = "SonarQube server URL"
  type        = string
  default     = "https://sonarcloud.io"
}

variable "sonar_token" {
  description = "SonarQube token (stored in Parameter Store)"
  type        = string
  default     = "/sonar/token"
}

variable "notification_emails" {
  description = "List of email addresses for security report notifications"
  type        = list(string)
  default     = []
}

variable "sender_email" {
  description = "Sender email address for security reports"
  type        = string
}

variable "ses_domain" {
  description = "SES domain for email sending (optional)"
  type        = string
  default     = ""
}
