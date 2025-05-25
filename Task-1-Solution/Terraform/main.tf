terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "devops_project_instance" {
  ami= terraform.workspace != "default" ? lookup(var.myami, terraform.workspace) : data.aws_ami.al2023.id
  instance_type = var.ec2_type
  count = var.num_of_instance
  iam_instance_profile = "devops-project-profile-techpro"
  key_name = var.ec2_key
  vpc_security_group_ids = aws_security_group.devops_project_sgr.*.id
  tags = {
    Project = "Devops-Project-Server"
    Name = "${terraform.workspace}_server"
  }
}

data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = ["${terraform.workspace}-Security-Group"]
  }

  filter {
    name   = "vpc-id"
    values = ["<your-vpc-id>"]
  }
}

resource "aws_security_group" "devops_project_sgr" {
  count = length(data.aws_security_group.existing_sg.id) == 0 ? 1 : 0

  name        = "${terraform.workspace}-Security-Group"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-Security-Group"
  }
}

data "aws_ami" "al2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "name"
    values = ["al2023-ami-2023*"]
  }
}