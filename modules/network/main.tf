resource "aws_vpc" "first_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "myFirstVpc"
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.first_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_az
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id            = aws_vpc.first_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_az
  tags = {
    Name = "PrivateSubnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.first_vpc.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.publicsubnet.id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = "mynatgateway"
  }
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.first_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.first_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "privateRTassociation" {
  route_table_id = aws_route_table.privateRT.id
  subnet_id      = aws_subnet.privatesubnet.id
}

resource "aws_route_table_association" "publicRTassociation" {
  route_table_id = aws_route_table.publicRT.id
  subnet_id      = aws_subnet.publicsubnet.id
}
