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
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  token = var.token
}

resource "aws_instance" "terraform_ez_server" {
  ami           = data.aws_ssm_parameter.ami.value
  instance_type = var.instance_type
  key_name = aws_key_pair.server_key_pair.id
  vpc_security_group_ids = [ aws_security_group.terraform_ez_server_security.id ]
}
