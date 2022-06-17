
# VPC 
resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpcCidr
  instance_tenancy = "default"

  tags = {
    Name        = "${var.prefix}-vpc"
    Environment =  var.env
    Project     = var.project
  }
}

# Public Subnet 
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.100.1.0/24"

  tags = {
    Name        = "${var.prefix}-pubsubnet"
    Environment =  var.env
    Project     =  var.project
  }
}


resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.100.5.0/24"

  tags = {
    Name        = "${var.prefix}-prvsubnet"
    Environment =  var.env
    Project     = var.project
  }

}


resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.100.3.0/24"

  tags = {
    Name        = "${var.prefix}-websubnet"
    Environment =  var.env
    Project     = var.project
  }
}



resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name        = "${var.prefix}-igw"
    Environment =  var.env
    Project     =  var.project
  }
}



