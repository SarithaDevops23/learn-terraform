resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.nano"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "sample"
  }
 }
  data "aws_ami" "example" {
  most_recent = true
  owners       = [099720109477]
  name_regex = "Centos-8-Devops-Practice"
 }

 resource "aws_security_group" "sg" {
  name        = "sample"
  description = "Allow TLS inbound traffic"
  

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   tags = {
    Name = "sample"
  }

  }