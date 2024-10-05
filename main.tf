provider "aws" {
  region = "us-west-2"
}


locals {
env = "Teraform"
}

variable "instance_count"{
default = 2
}

variable "instance_type"{
default = "t2.medium"
}



resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
 tags = {
    Name = "${local.env}-VPC"
 }
}



resource "aws_subnet" "subnet" {
vpc_id = aws_vpc.vpc.id
cidr_block = "10.10.10.0/24"
 tags = {
    Name = "${local.env}-subnet"
 }
}

resource "aws_instance" "ec2" {
  count         = var.instance_count
subnet_id = aws_subnet.subnet.id
  ami           = "ami-01b4a58555824692b"
  instance_type = var.instance_type
 tags = {
    Name = "${local.env}-Server-${count.index + 1}"
 }
}


output "abc" {
value = aws_instance.ec2
}
