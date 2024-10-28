terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.token
}

resource "aws_instance" "terraform_ez_server" {
  ami                    = data.aws_ssm_parameter.ami.value
  instance_type          = var.instance_type
  key_name               = aws_key_pair.server_key_pair.id
  vpc_security_group_ids = [aws_security_group.terraform_ez_server_security.id]
  user_data =   (var.custom_setup_script != null) ? file(var.custom_setup_script) : <<-EOF
                  #!/bin/bash
                  cd home/ec2-user
                  sudo yum update -y
                  sudo yum -y install docker
                  sudo service docker start
                  sudo docker run -d -p 80:80 -p 443:443 nginx
                EOF 
                // checks if the user provided a custom setup script, if not just installs docker and runs nginx
}
