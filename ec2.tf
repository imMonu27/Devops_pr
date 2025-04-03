//creating aws ec2(elastic cloude computing) instance 

resource "aws_instance" "PRinstance" {
  ami = "ami-071226ecf16aa7d96"
  subnet_id = aws_subnet.publicsubnet.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name      = aws_key_pair.my_key.key_name
}