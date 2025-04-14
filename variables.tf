variable "ami_id" {
  type = string
  default = "ami-071226ecf16aa7d96"
  description = "ami id for creating instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "instace type"
}

variable "all_network_cidr_block" {
  type = string
  default = "0.0.0.0/0"
  description = "accept all network req "
}