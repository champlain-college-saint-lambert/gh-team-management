locals {
  members_data = jsondecode(file("${path.module}/members.json"))
}

resource "github_team" "workshop" {
  name                      = "git_workshop"
  description               = "Git Workshop Team"
  privacy                   = "closed"
  create_default_maintainer = true
}

resource "github_membership" "org_members" {
  for_each = toset(local.members_data["git_workshop"])

  username = each.value
  role     = "member"
}

# 2. Add them to the team as a 'maintainer'
resource "github_team_membership" "workshop_members" {
  for_each = toset(local.members_data["git_workshop"])

  team_id  = github_team.workshop.id
  username = each.value
  role     = "maintainer"

  # Ensure they are invited to the org before being added to the team
  depends_on = [github_membership.org_members]
}