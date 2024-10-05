provider "aws" { 
us-east-1
}

resource "aws_instance" "one" {
count = 2
ami = "ami-00b8917ae86a424c9"
instance_type = "t2.micro"
tags = {
Name = "raham-server"
}
}
