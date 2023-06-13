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

variable "quota_limit" {
  description = "The maximum number of requests that can be made in a given time period"
}

variable "quota_offset" {
  description = "The number of requests subtracted from the limit for the first time period"
}

variable "quota_period" {
  description = "The time period in which the limit applies (DAY, WEEK, MONTH)"
}

variable "throttle_burst_limit" {
  description = "The maximum rate limit over a time ranging from one to a few seconds"
}

variable "throttle_rate_limit" {
  description = "The steady-state rate limit (average requests per second over an extended period of time)"
}
