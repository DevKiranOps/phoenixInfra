resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.100.1.0/24"

  tags = {
    Name        = "phoenix-pubsubnet"
    Environment = "Test"
    Project     = "phoenix"
  }
}


resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.100.5.0/24"

  tags = {
    Name        = "phoenix-prvsubnet"
    Environment = "Test"
    Project     = "phoenix"
  }

}


resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.100.3.0/24"

  tags = {
    Name        = "phoenix-websubnet"
    Environment = "Test"
    Project     = "phoenix"
  }
}



resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name        = "phoenix-igw"
    Environment = "Test"
    Project     = "phoenix"
  }
}


resource "aws_vpc" "myvpc" {
  cidr_block       = "10.100.0.0/20" # 10.100.0.0 - 10.100.15.255
  instance_tenancy = "default"

  tags = {
    Name        = "phoenix-vpc"
    Environment = "Test"
    Project     = "phoenix"
  }
}
