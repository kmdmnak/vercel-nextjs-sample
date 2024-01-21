variable "terraform_cloud_token" {
  type = string
  validation {
    condition     = length(var.terraform_cloud_token) > 0
    error_message = "You must provide a Terraform Cloud token to use this module."
  }
}

variable "git_branch" {
  type = string
  validation {
    condition     = length(var.github_branch_name) > 0
    error_message = "You must provide a GitHub branch name to use this module."
  }
}

variable "github_oauth_token" {
  type = string
  validation {
    condition     = length(var.github_oauth_token) > 0
    error_message = "You must provide a GitHub OAuth token to use this module."
  }
}

variable "workspace_name" {
  type = string
  validation {
    condition     = length(var.workspace_name) > 0
    error_message = "You must provide a Terraform Cloud workspace name to use this module."
  }
}

variable "vercel_api_token" {
  type = string
  validation {
    condition     = length(var.vercel_api_token) > 0
    error_message = "You must provide a Vercel API token to use this module."
  }
}
