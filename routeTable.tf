//creating route table

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

//association of route 

resource "aws_route_table_association" "privateRTassociation" {
  
  route_table_id = aws_route_table.privateRT.id
  subnet_id = aws_subnet.privatesubnet.id
}

resource "aws_route_table_association" "publicRTassociation" {
  route_table_id = aws_route_table.publicRT.id
  subnet_id = aws_subnet.publicsubnet.id
}