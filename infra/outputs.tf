output "instance_id" {
	value = aws_instance.ec2_demo.id
}

output "public_ip" {
	value = aws_instance.ec2_demo.public_ip
}

output "public_dns" {
	value = aws_instance.ec2_demo.public_dns
}