resource "tfe_workspace" "resource_vercel" {
  name              = format("vercel-%s", var.workspace_name)
  organization      = tfe_organization.vercel-nextjs-sample.name
  project_id        = tfe_project.vercel-nextjs-sample.id
  queue_all_runs    = false
  working_directory = "infrastructure/vercel"
  vcs_repo {
    branch         = var.git_branch
    identifier     = "kmdmnak/vercel-nextjs-sample"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}


resource "tfe_variable" "vercel_api_token" {
  value        = var.vercel_api_token
  category     = "terraform"
  key          = "vercel_api_token"
  sensitive    = true
  workspace_id = tfe_workspace.resource_vercel.id
}

resource "tfe_variable" "git_branch" {
  value        = var.git_branch
  category     = "terraform"
  key          = "git_branch"
  sensitive    = false
  workspace_id = tfe_workspace.resource_vercel.id
}

resource "tfe_notification_configuration" "vercel_deploy_hook" {
  count            = var.vercel_deploy_hook_url == null ? 0 : 1
  name             = format("vercel-%s-deploy-hook", var.workspace_name)
  enabled          = true
  destination_type = "generic"
  triggers         = ["run:completed"]
  url              = var.vercel_deploy_hook_url
  workspace_id     = tfe_workspace.resource_vercel.id
}

