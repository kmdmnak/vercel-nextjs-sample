
resource "vercel_project" "with_git" {
  name = "vercel-nextjs-sample"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "kmdmnak/vercel-nextjs-sample"
  }
}
