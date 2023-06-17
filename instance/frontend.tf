data "aws_ami" "example" {
  most_recent = true
  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "web" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.nano"

  tags = {
    Name = "first instance"
  }
  }