provider "aws" {
  region  = "us-east-1"
  profile = "driveguard"
}

resource "aws_security_group" "driveguard_sg" {
  name        = "driveguard-gitops-sg"
  description = "Security group for DriveGuard K3s cluster"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DZ API"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TSR API"
    from_port   = 8001
    to_port     = 8001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Fusion API (WebSockets)"
    from_port   = 8002
    to_port     = 8002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Argo CD UI"
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "k3s_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS us-east-1
  instance_type = "t3.micro"              # Free tier eligible

  vpc_security_group_ids = [aws_security_group.driveguard_sg.id]
  
  # IMPORTANT: Request a 20GB disk to hold the 6GB swap + K3s
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "DriveGuard-GitOps-K3s"
  }
}

output "public_ip" {
  value = aws_instance.k3s_server.public_ip
  description = "The public IP address of the K3s server"
}
