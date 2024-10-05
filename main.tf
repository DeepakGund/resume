provider "aws" {
  region = "us-west-2"
}

resource "local_file" "private_key_pem" {
filename = "key.pem"
content = tls_private_key.rsa-2048_example.private_key_pem
}


locals {
env = "swiggy"
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
  count         = 5
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
