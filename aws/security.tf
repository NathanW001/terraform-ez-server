resource "aws_key_pair" "server_key_pair" {
  public_key = var.public_key
}

resource "aws_security_group" "terraform_ez_server_security" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_vpc_security_group_egress_rule" "outgoing_any" {
  security_group_id = aws_security_group.terraform_ez_server_security.id
  from_port         = 0
  to_port           = 0
  ip_protocol          = "-1"
  cidr_ipv4       = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "incoming_ssh" {
  security_group_id = aws_security_group.terraform_ez_server_security.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4       = "0.0.0.0/0"
}
