//creating aws ec2(elastic cloude computing) instance 

resource "aws_instance" "PRinstance" {
  ami = var.ami_id
  subnet_id = module.network.public_subnet_id
  instance_type = var.instance_type
  //associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name      = aws_key_pair.my_key.key_name

  
   user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF

}