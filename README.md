# Terraform ECS Pipeline with ECR

Terraform configuration for deploying a complete CI/CD pipeline with ECS and ECR, including a sample Node.js application.

## Prerequisites

- Terraform installed
- AWS CLI configured
- GitHub repository with the sample application code
- GitHub personal access token
- Docker (for local testing)

## Deployment

1. Copy and configure variables:
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the plan:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

## Sample Application

The included sample application is a simple Node.js Express server that:
- Serves a JSON response at `/` with message and timestamp
- Provides a health check endpoint at `/health`
- Runs on port 80 inside the container

## Resources Created

- ECR repository
- ECS Fargate cluster and service with health checks
- VPC with public subnets
- Security groups
- CodeBuild project with Docker support
- CodePipeline with GitHub integration
- IAM roles and policies
- CloudWatch log group
- S3 bucket for artifacts

## Cleanup

```bash
terraform destroy
```

## Outputs

- ecr_repository_url: ECR repository URL
- ecs_cluster_name: ECS cluster name
- pipeline_name: CodePipeline name
- ecs_service_name: ECS service name

## Testing the Application

After deployment, the application will be accessible via the ECS service. You can test the endpoints:
- `GET /` - Returns application info
- `GET /health` - Health check
