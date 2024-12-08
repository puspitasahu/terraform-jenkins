terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Specify the version of the AWS provider
    }
  }
}

# Specify the AWS provider
provider "aws" {
  region = "us-east-1"  # Set the AWS region
}

# Example resource to create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0614680123427b75e"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"  # Instance type

  tags = {
    Name = "MyInstance"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}
