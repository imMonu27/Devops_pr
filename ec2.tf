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
              apt-get update -y
              apt-get install -y docker.io

              systemctl start docker
              systemctl enable docker

              mkdir /home/ubuntu/my-nginx
              cd /home/ubuntu/my-nginx

              docker pull devmohit27/dev_pr:v1
              docker run -d -p 80:80 devmohit27/dev_pr:v1
            EOF




}