variable "vercel_api_token" {
  type = string
  validation {
    condition     = length(var.vercel_api_token) > 0
    error_message = "vercel_api_token is required"
  }
}
