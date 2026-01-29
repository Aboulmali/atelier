variable "region" {
  default = "us-west-1"
}

variable "ami" {
  type    = string
  default = "ami-038bba9a164eb3dc1" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "Aboulmali_EC2_Demo"
}

variable "instance_size" {
  default = "t2.micro"
}

variable "instance_env" {
  default = "Dev"
}
