resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "sample"
  }
 }
 
 data "aws_ami" "example" {
  owners = ["532427859183"]
  most_recent = true
  name_regex = "Centos-8-Devops-Practice"
 }