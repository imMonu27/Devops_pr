//define vpc

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
        Name = "myFirstVpc"
  }
}