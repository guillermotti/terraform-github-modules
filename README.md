# Prerequisites

- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
- Create [GitHub account](https://github.com/join)
- Create [GCP](https://cloud.google.com/) account and setup [gcloud CLI](https://cloud.google.com/sdk/docs/install)

## Clone this repo

```sh
git clone https://github.com/guillermotti/terraform-github-modules.git
cd terraform-github-modules
code .
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

## Restrict repository creation

1. Open `Member privileges` tab under organization settings window.
2. Uncheck `Private` and `Public` for `Repository creation` section.
3. Click on Save button.

## Set up environment variables

- Set your own GITHUB_TOKEN, GITHUB_ORG and BILLING_ACCOUNT as environment variables:

```sh
export BILLING_ACCOUNT=BILLING_ACCOUNT
export GITHUB_TOKEN=GITHUB_TOKEN
export GITHUB_ORG=GITHUB_ORG
```

## Create GCP project and bucket

1. Run `gcloud config configurations list` to verify you have an account ready.
2. Run the following commands:

```sh
terraform init
terraform plan -out=fit.plan -var="billing_account=$BILLING_ACCOUNT"
terraform apply fit.plan
```

3. Uncomment the `backend` block setting the `state_bucket` output from the previous apply.
4. Run the following commands:

```sh
terraform init #type "yes"
terraform plan -out=fit.plan -var="billing_account=$BILLING_ACCOUNT"
rm -rf *.state
```

## Create teams

1. Edit teams/teams.tf to create any team to the organization.
2. Run the following commands:

```sh
cd terraform-github-modules/teams
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```
    
## Create admins

1. Edit admins/admins.tf to create any admin to the organization.
2. Run the following commands:

```sh
cd ../admins
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```

## Create repos

1. Edit repos/back/repos.tf to create any repo to the back team in the organization.
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
cd ../..
git add * .gitignore
git commit -m "Adding TF code"
git push origin main
```

## Create users

1. Edit users/users.tf to invite any user to the organization.
2. Run the following commands:

```sh
cd ../users
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```

## Create a branch protection

1. Edit repos/front/repos.tf to create a new repository with a branch protection.
2. Run the following commands:

```sh
cd ../repos/front
terraform init
terraform plan -out=fit.plan -var="github_token=$GITHUB_TOKEN" -var="github_organization=$GITHUB_ORG"
terraform apply fit.plan
```

## Bonus track: CI/CD

- Pull Request Automation with [Atlantis](https://www.runatlantis.io/)
- GitHub Actions with [Terraform Cloud](https://learn.hashicorp.com/tutorials/terraform/github-actions)
- Custom solution with CI/CD tool of your choice