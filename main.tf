provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = var.instance_count
ami = "ami-0e001c9271cf7f3b9"
instance_type = var.instance_type
tags = {
Name = var.instance_name
}
}

cat variable.tf
variable "instance_count" {
}

variable "instance_type" {
}

variable "instance_name" {
}

cat dev.tfvars
instance_count = 1

instance_type = "t2.micro"

instance_name = "dev-server"

cat test.tfvars
instance_count = 2

instance_type = "t2.medium"

instance_name = "test-server"

cat variable.tfvars
instance_count = 3

instance_type = "t2.large"

instance_name = "prod-server"
