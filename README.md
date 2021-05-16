# Prerequisites

- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
- Create a [GitHub account](https://github.com/join)
- Bucket to store Terraform state file remotely (GCP, AWS, AZURE, k8s...)

# Steps to start

## Clone this repo

```sh
git clone https://github.com/guillermotti/terraform-github-modules.git
```

## Create a [GitHub organization](https://github.com/account/organizations/new?coupon=&plan=team_free)

1. Enter a name for the organization.
2. Add a contact email.
3. Select who will manage the organization.
4. Skip the step to add organization members, we are going to use this repo to add members.
5. Submit the last part adding whatever you want.

## Create a [token](https://github.com/settings/tokens/new)

1. Click on Generate new token button.
2. Add a note, for example `GitHubOrgTerraform`
3. Select all scopes
4. Click on Generate token button.
5. Copy the generated token and keep it in a safe place.

## Configure [remote backend](https://www.terraform.io/docs/language/settings/backends/remote.html). 

- For example [GCS backend](https://www.terraform.io/docs/language/settings/backends/gcs.html). **NOTE**: The bucket must exist prior to configuring the backend.

## Set up environment variables

- Set your own GITHUB_TOKEN and GITHUB_ORG as environment variables:

```sh
export GITHUB_TOKEN=GITHUB_TOKEN
export GITHUB_ORG=GITHUB_ORG
```

## Create teams

1. Edit teams/teams.tf to create any team to the org.
2. Run the following commands:

```sh
cd terraform-github-modules/teams
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```
    
## Create admins

1. Edit admins/admins.tf to create any admin to the org.
2. Run the following commands:

```sh
cd ../admins
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```

## Create repos

1. Edit repos/back/repos.tf to create any repo to the back team in the org.
2. Run the following commands:

```sh
cd ../repos/back
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```

3. Edit repos/admin/repos.tf to save this configuration in a repository inside the new organization.

```sh
cd ../admin
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
git remote rename origin modules
git remote add origin git@github.com:$GITHUB_ORG/admin-terraform-github.git
git push -u origin main --force
```

## Create users

## Create a branch protection

## Bonus steps

- Remote backend
- Atlantis