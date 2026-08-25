# GitHub Team Management

This repository uses an automated IssueOps pipeline to manage team memberships for the `git_workshop` team via Terraform. 

Instead of manually requesting access from an administrator, you can use our self-service portal to automatically provision your access and update the repository state.

## How to Onboard Yourself

To get added to the `git_workshop` team, simply use our automated Issue Template!

**Important:** You *must* be logged into your GitHub account to request access. If you are browsing anonymously, the "New issue" button will be disabled.

1. Go to the **[Issues](../../issues)** tab.
2. Click the green **New issue** button.
3. Next to "Self-Service Onboarding", click **Get started**.
4. In the title of the issue, replace `YOUR_GITHUB_USERNAME` with your actual GitHub handle. (Make sure you keep the `Onboard: ` part!).
5. Click **Submit new issue**.

### What happens next?

Once you submit the issue, an automated GitHub Actions pipeline will:
1. Verify that your GitHub handle exists.
2. Ensure you are not already in the team.
3. Automatically update the backend infrastructure using Terraform.
4. Commit your username to the `terraform/members.json` source of truth.
5. Comment on your issue with a success message and close it.

Check your email! You will receive an invitation from GitHub to join the organization and the team.

---

## For Administrators: Manual Removal

To remove a user from the team:
1. Edit `terraform/members.json`.
2. Remove the user's handle from the `git_workshop` array.
3. Commit directly to `main` (or via a Pull Request). 
4. The pipeline will automatically run and revoke the user's access.