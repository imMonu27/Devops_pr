//create netgateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.first_vpc.id
  
}

resource "aws_eip" "nat_eip" {
  //instance =  aws_instance.PRinstance.id//optionl
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id = aws_subnet.publicsubnet.id
  allocation_id = aws_eip.nat_eip.allocation_id
  tags = {
    Name="mynatgateway"
  }
}