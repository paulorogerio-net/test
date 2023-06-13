resource "aws_api_gateway_usage_plan" "usage_plan" {
  name        = var.usage_plan_name
  description = "A usage plan"

  api_stages {
    api_id = var.api_id
    stage  = var.stage_name
  }

  quota_settings {
    limit  = var.quota_limit
    offset = var.quota_offset
    period = var.quota_period
  }

  throttle_settings {
    burst_limit = var.throttle_burst_limit
    rate_limit  = var.throttle_rate_limit
  }
}

resource "aws_api_gateway_api_key" "api_key" {
  name = var.api_key_name
}

resource "aws_api_gateway_usage_plan_key" "usage_plan_key" {
  key_id        = aws_api_gateway_api_key.api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
}
