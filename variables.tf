variable "ami_id" {
  type = string
  description = "ami id for creating instance"
}

variable "instance_type" {
  type = string
  description = "instace type"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_subnet_cidr2" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "public_az" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "private_az" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "private_az2" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "ingress_rules" {
  description = "Map of ingress rules for security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "file_path" {
  type = string
  description = "path to store file locally on pc"
}
