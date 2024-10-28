output "instance_id" {
  value = aws_instance.terraform_ez_server.id
}

output "instance_public_ip" {
  value = aws_instance.terraform_ez_server.public_ip
}

output "ssh_command" {
  value = "ssh -i <./filepath/to/private_key.pem> ec2-user@${aws_instance.terraform_ez_server.public_ip}"
}