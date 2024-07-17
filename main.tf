provider "aws" {
  region     = "eu-west-2"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"

}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  
}

variable "environment" {
  description = "deployment environment"
  
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name : "development"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "eu-west-2a"
  tags = {
    Name : "subnet-1-dev"
  }
}

