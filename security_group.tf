resource "aws_security_group" "alb" {
  name = "sg_alb_terraform"
  description = "HTTP access from anywhere"
  vpc_id = aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = [49153,65535]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "instance" {
  name        = "sg_server_terraform"
  description = "Allow access from load balancer sg"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}