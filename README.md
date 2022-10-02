# Terraform
Week 7 of Applaudo Studios DevOps Program

## Description
- This repository contains the terraform code to deploy to lambdas within a single API Gateway.
- The HTTP requests are handled by the lambda functions. The lambda functions are written in javascript.
- Finally, the functions are monitored by CloudWatch.

## Requirements
- Terraform
- AWS account
- AWS CLI
- AWS credentials configured using a IAM Role

## Usage
- Clone the repository
- Configure your AWS credentials using the `aws configure` command
- Run `terraform init` inside the `terraform` folder to initialize the project
- Run `terraform plan` to see the changes that will be applied
- Run `terraform apply` to apply the changes
- Once you are done with the project, run `terraform destroy` to delete the resources