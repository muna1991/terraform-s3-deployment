# terraform-s3-bucket deployment by using workflow call
## 1. Workflow Overview
yaml
name: "Deploy Terraform with Shared Workflow"
The name field defines the workflow name displayed in the GitHub Actions tab for better organization and readability.

Documentation: Naming workflows
2. Workflow Triggers
yaml
Copy code
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main  
The on field specifies the events that trigger the workflow. Here:

Push to the main branch: Runs the workflow automatically whenever code is pushed to the main branch.

Pull Requests to the main branch: Runs the workflow automatically on pull requests targeting the main branch.

Documentation: Events that trigger workflows

3. Calling a Shared Workflow
yaml
Copy code
jobs:
  call-terraform:
    uses: muna1991/Terrform-Library/.github/workflows/terraform.yml@main
Job ID: call-terraform defines a unique identifier for the job, which will run the shared workflow.

Calling the Shared Workflow: The uses keyword references the shared workflow located in muna1991/Terrform-Library repository, specifically the terraform.yml file in .github/workflows on the main branch.

Branch Specification: The @main suffix specifies the branch or tag to pull the workflow from, ensuring consistency across calls.

Documentation: Calling a reusable workflow

4. Passing Inputs to the Shared Workflow
yaml
Copy code
    with:
      bucket_name: "mithu-aditya-s3-buckets"
      region: "ap-south-1"
The with keyword specifies inputs for the shared workflow. Here:

bucket_name: The name of the S3 bucket.
region: AWS region for the deployment, with a default of "ap-south-1".
Inputs should match those defined in the shared workflow, so the called workflow can use them as variables.

Documentation: Passing inputs to a reusable workflow
5. Passing Secrets to the Shared Workflow
yaml
Copy code
    secrets:
      aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      aws_session_token: ${{ secrets.AWS_SESSION_TOKEN }}
The secrets keyword passes sensitive information securely:

AWS Credentials: Secrets like aws_access_key_id, aws_secret_access_key, and aws_session_token are passed from repository secrets to the shared workflow, allowing Terraform to authenticate with AWS.
Ensure that the secrets match the names specified in your repository’s settings.

Documentation: Passing secrets to a reusable workflow
Summary
This structure allows you to maintain a centralized Terraform workflow in a shared repository, ensuring reusability, standardization, and secure handling of sensitive AWS credentials across multiple workflows and repositories. This setup enables efficient, secure infrastructure automation with GitHub Actions and Terraform.
