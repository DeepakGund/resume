provider "aws" {
  region = "us-west-2"
}


locals {
env = "Teraform"
}

variable "instance_count"{
default = 2
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
  instance_type = "t2.micro"
 tags = {
    Name = "${local.env}-ec2"
 }
}


output "abc" {
value = aws_instance.ec2
}
