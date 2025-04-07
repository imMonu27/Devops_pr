output "vpc_id" {
  value = aws_vpc.first_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.publicsubnet.id
}

output "private_subnet_id" {
  value = aws_subnet.privatesubnet.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
