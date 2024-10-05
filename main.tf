provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "one" {
ami = "ami-00b8917ae86a424c9"
instance_type = "t2.micro"
tags = {
Name = "raham-server"
}
}

output "raham" {
value = [aws_instance.one.public_ip, aws_instance.one.private_ip, aws_instance.one.public_dns]
}
