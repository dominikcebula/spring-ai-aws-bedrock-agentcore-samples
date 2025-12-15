output "agent_runtime_id" {
  description = "ID of the created agent runtime"
  value       = aws_bedrockagentcore_agent_runtime.mcp_server.agent_runtime_id
}

output "agent_runtime_arn" {
  description = "ARN of the created agent runtime"
  value       = aws_bedrockagentcore_agent_runtime.mcp_server.agent_runtime_arn
}

output "agent_runtime_version" {
  description = "Version of the created agent runtime"
  value       = aws_bedrockagentcore_agent_runtime.mcp_server.agent_runtime_version
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.server_ecr.repository_url
}

output "ecr_repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.server_ecr.arn
}

output "agent_execution_role_arn" {
  description = "ARN of the agent execution role"
  value       = aws_iam_role.agent_execution.arn
}

output "cognito_user_pool_id" {
  description = "ID of the Cognito User Pool"
  value       = aws_cognito_user_pool.mcp_user_pool.id
}

output "cognito_user_pool_arn" {
  description = "ARN of the Cognito User Pool"
  value       = aws_cognito_user_pool.mcp_user_pool.arn
}

output "cognito_user_pool_client_id" {
  description = "ID of the Cognito User Pool Client"
  value       = aws_cognito_user_pool_client.mcp_client.id
}

output "cognito_discovery_url" {
  description = "Cognito OIDC Discovery URL"
  value       = "https://cognito-idp.${data.aws_region.current.id}.amazonaws.com/${aws_cognito_user_pool.mcp_user_pool.id}/.well-known/openid-configuration"
}

output "test_username" {
  description = "Test username for authentication"
  value       = "testuser"
}

output "test_password" {
  description = "Test password for authentication"
  value       = "MyPassword123!"
  sensitive   = true
}

output "get_token_command" {
  description = "Command to get authentication token"
  value       = "python get_token.py ${aws_cognito_user_pool_client.mcp_client.id} testuser MyPassword123! ${data.aws_region.current.id}"
}
