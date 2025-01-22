# Terraform Provider Configuration
provider "aws" {
  region = "us-west-2"
}

# VPC Module Example
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"
  
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# EC2 Instance Example
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with your desired AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

# Output example
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
