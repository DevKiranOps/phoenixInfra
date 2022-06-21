# Retrieve AZ info  
data "aws_availability_zones" "available" {
  state = "available"
}


# VPC 
resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpcCidr
  instance_tenancy = "default"

  tags = {
    Name        = "${var.prefix}-vpc"
    Environment = var.env
    Project     = var.project
  }
}

# Public Subnet 
resource "aws_subnet" "public" {
  count = length(data.aws_availability_zones.available.names)
  vpc_id     = aws_vpc.myvpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block = element(var.pubSubnetCidr, count.index)
  tags = {
    Name        = "${var.prefix}-pubsubnet-${count.index}"
    Environment = var.env
    Project     = var.project
  }
}



resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name        = "${var.prefix}-igw"
    Environment = var.env
    Project     = var.project
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name        = "${var.prefix}-igw"
    Environment = var.env
    Project     = var.project
  }
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mygw.id

}

resource "aws_route_table_association" "public" {
  count = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}


# resource "aws_route_table_association" "web" {
#   subnet_id      = aws_subnet.web.id
#   route_table_id = aws_route_table.public.id
# }




# resource "aws_subnet" "private" {
#   vpc_id     = aws_vpc.myvpc.id
#   cidr_block = var.privateSubnetCidr

#   tags = {
#     Name        = "${var.prefix}-prvsubnet"
#     Environment = var.env
#     Project     = var.project
#   }

# }

# resource "aws_subnet" "web" {
#   vpc_id                  = aws_vpc.myvpc.id
#   cidr_block              = var.webSubnetCidr
#   map_public_ip_on_launch = true
#   tags = {
#     Name        = "${var.prefix}-websubnet"
#     Environment = var.env
#     Project     = var.project
#   }
# }

