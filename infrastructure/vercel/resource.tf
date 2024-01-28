
resource "vercel_project" "vercel-nextjs-sample" {
  name      = "vercel-nextjs-sample"
  framework = "nextjs"
  git_repository = {
    type              = "github"
    repo              = "kmdmnak/vercel-nextjs-sample"
    production_branch = var.git_branch
  }
  root_directory = "frontend"
}

resource "vercel_deployment" "dev" {
  project_id        = vercel_project.with_git.id
  ref               = "dev"
  delete_on_destroy = true
}
