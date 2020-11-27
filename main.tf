resource "aws_instance" "example" {
  ami                    = "ami-0b0f4c27376f8aa79"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "terraform-example"
  }
  user_data = file("./install_image.sh")
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 80
    to_port     = 80
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