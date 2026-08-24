# GitHub Team Onboarding (IssueOps)

This repository manages membership for the `champlain-college-saint-lambert` organization’s `git_workshop` team using Terraform.  
Onboarding is automated through an IssueOps workflow that reads and updates `terraform/members.json` as the source of truth.

## How to Request Onboarding

1. Go to the repository’s **Issues** tab.
2. Click **New issue**.
3. Set the issue title using this exact format: `Onboard: <YourGitHubUsername>`.
   - Example: `Onboard: DylanBrass`
4. Add any optional context in the issue body (not required).
5. Submit the issue.

## What Happens After You Submit

1. **Automated validation** runs when your issue is opened.
2. The workflow checks that:
   - the title starts with `Onboard:`
   - the GitHub username exists
   - the username is not already listed in `terraform/members.json`
3. If valid, the workflow:
   - appends your username to `terraform/members.json`
   - runs Terraform to apply the membership change
   - commits the updated membership file back to this repository
4. The workflow comments on your issue with the result and closes it automatically.
5. If everything succeeds, GitHub sends the team invitation email for you to accept.

## Administrator Note

Manual member removal is not automated in this flow.  
To remove a user, update `terraform/members.json` directly and commit the change.
