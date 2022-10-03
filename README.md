# Terraform
Week 7 of Applaudo Studios DevOps Program

## Description
- This repository contains the terraform code to deploy to lambdas within a single API Gateway.
- The HTTP requests are handled by the lambda functions. The lambda functions are written in javascript.
1. The first lambda function is called `hello` and it returns a JSON object with a message. 
It also accepts a query parameter called `name` and returns a personalized message.
The lambda function is connected to the API Gateway using the `GET` method.
![hello](images/hello.png)
2. The second lambda function is called `goodbye` and it returns a JSON object with a message.
It also accepts a query parameter called `name` and returns a personalized message.
The lambda function is connected to the API Gateway using the `POST` method.
![goodbye](images/goodbye.png)
- Finally, the functions are monitored by CloudWatch.
- You can execute the lambdas by using an API client like Postman. 
It is only necessary to select the right method and the url given by the outputs. 
![outputs](images/outputs.png)
- The lambdas are connected to a single API Gateway.
![api_gateway](images/api_gateway.png)
## Requirements
- Terraform
- AWS account
- AWS CLI
- AWS credentials configured using a IAM Role

## Usage
- Clone the repository
- Configure your AWS credentials in terraform cloud, if you don't have an account you can create one for free.
- Create a new workspace and select the repository.
- Configure the variables in the workspace. In this case, they will be the AWS IAM credentials.
- Run terraform login and sign in with your Terraform Cloud account.
- Run `terraform init` inside the `terraform` folder to initialize the project
- Run `terraform plan` to see the changes that will be applied
- Run `terraform apply` to apply the changes
- Once you are done with the project, run `terraform destroy` to delete the resources