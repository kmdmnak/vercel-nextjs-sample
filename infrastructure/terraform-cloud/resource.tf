resource "tfe_organization" "vercel-nextjs-sample" {
  name  = "vercel-nextjs-sample"
  email = "kmdmuneaki@gmail.com"
}

resource "tfe_oauth_client" "github" {
  name             = "github"
  organization     = tfe_organization.vercel-nextjs-sample.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_project" "vercel-nextjs-sample" {
  organization = tfe_organization.vercel-nextjs-sample.name
  name         = "vercel-nextjs-sample"
}

resource "tfe_workspace" "vercel-nextjs-sample" {
  name           = var.workspace_name
  organization   = tfe_organization.vercel-nextjs-sample.name
  project_id     = tfe_project.vercel-nextjs-sample.id
  queue_all_runs = false
  vcs_repo {
    branch         = var.github_branch_name
    identifier     = "kmdmnak/vercel-nextjs-sample"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}
