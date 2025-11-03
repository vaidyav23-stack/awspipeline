# SSM Parameters for secure token storage
resource "aws_ssm_parameter" "github_token_placeholder" {
  name  = var.github_token_path
  type  = "SecureString"
  value = "PLACEHOLDER"
  description = "GitHub personal access token for CodePipeline"
  
  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "sonar_token_placeholder" {
  name  = "/sonar/token"
  type  = "SecureString"
  value = "PLACEHOLDER"
  description = "SonarQube token for security scanning"
  
  lifecycle {
    ignore_changes = [value]
  }
}