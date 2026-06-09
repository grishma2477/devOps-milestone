data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "docker_server_sg" {
  name = "docker_server-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["202.7.251.87/32"] # Only mine public IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "docker_server_key_pair" {
  key_name = local.aws_key_name
  public_key = file("~/.ssh/aws_key.pub")
}

resource "aws_instance" "docker_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = local.aws_instance_type
  key_name               = aws_key_pair.docker_server_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.docker_server_sg.id]

  tags = {
    Name = "Docker-Server"
    ENV = terraform.workspace
  }
}