//creating aws ec2(elastic cloude computing) instance 

resource "aws_instance" "PRinstance" {
  ami = "ami-071226ecf16aa7d96"
  subnet_id = aws_subnet.privatesubnet.id
  instance_type = "t2.micro"
}