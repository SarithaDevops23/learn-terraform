resource "aws_instance" "test" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.nano"

  tags = {
    Name = "first instance"
  }
  }