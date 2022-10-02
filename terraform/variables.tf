variable "region" {
  type    = string
  default = "us-east-1"
}

variable "stage_name" {
  type    = string
  default = "dev"
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable aws_credentials_files {
  type    = list(string)
  default = ["~/.aws/credentials"]
}