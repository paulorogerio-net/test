
variable "api_id" {
  description = "The API ID for the API Gateway"
}

variable "stage_name" {
  description = "The name of the stage"
}

variable "usage_plan_name" {
  description = "The name for the usage plan"
}

variable "api_key_name" {
  description = "The name for the API key"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_api_gateway_usage_plan" "usage_plan" {
  name        = var.usage_plan_name
  description = "A usage plan"

  api_stages {
    api_id = var.api_id
    stage  = var.stage_name
  }

  quota_settings {
    limit  = 5000
    offset = 2
    period = "WEEK"
  }

  throttle_settings {
    burst_limit = 200
    rate_limit  = 100
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
