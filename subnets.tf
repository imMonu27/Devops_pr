//creating private subnates

resource "aws_subnet" "publicsubnet" {
  vpc_id = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "privatesubnet" {
  vpc_id = aws_vpc.first_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}