provider "aws" {
  region            = var.region
}

resource "aws_instance" "ec2_demo" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
    Env  = var.instance_env
  }
}
