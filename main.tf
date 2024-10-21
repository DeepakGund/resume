provider "aws" {
  region = "us-west-2"
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "jenkins-VPC"
  }
}

# vpc-subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.10.0/24"
  }

# EC2
resource "aws_instance" "ec2" {
ami = "ami-0d9c5e03a845034ff"
instance_type = "t2.micro"
}


output "abc" {
  value = aws_instance.ec2
}
