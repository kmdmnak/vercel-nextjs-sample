
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
