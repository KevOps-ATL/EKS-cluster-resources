resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   = "DummyMachine"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "aws_security_group" "securitygroup" {
  name        = "DummySecurityGroup"
  description = "Security group for eks instances"
  vpc_id      = var.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  tags = {
    "Name" = "EKS-SG"
  }
}

resource "aws_instance" "ec2instance" {
  instance_type           = "t2.micro"
  ami                     = "ami-03d315ad33b9d49c4"
  subnet_id               = var.subnet_id
  security_groups         = [aws_security_group.securitygroup.id]
  key_name                = aws_key_pair.ssh.key_name
  disable_api_termination = false
  ebs_optimized           = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "EKSinstance"
  }
}
