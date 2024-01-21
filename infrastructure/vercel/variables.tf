variable "vercel_api_token" {
  type = string
  validation {
    condition     = length(var.vercel_api_token) > 0
    error_message = "vercel_api_token is required"
  }
}

variable "git_branch" {
  type = string
  validation {
    condition     = length(var.git_branch) > 0
    error_message = "git_branch is required"
  }
}
