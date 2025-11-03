output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "pipeline_name" {
  description = "CodePipeline name"
  value       = aws_codepipeline.app_with_security.name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.app.name
}

output "security_reports_bucket" {
  description = "S3 bucket for security reports"
  value       = aws_s3_bucket.security_reports.bucket
}

output "sender_email" {
  description = "SES sender email for security reports"
  value       = var.sender_email
}
