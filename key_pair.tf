//creating key pair

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-terraform-key"
  public_key = tls_private_key.my_key.public_key_openssh
}


resource "local_file" "private_key" {
  content  = tls_private_key.my_key.private_key_pem
  filename = var.file_path
}
