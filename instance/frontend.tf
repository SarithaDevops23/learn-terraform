resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids=["sg-07ceced18b53fa66d"]

  tags = {
    Name = "frontend"
  }
 }
 
 data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
 }

 connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U  https://github.com/SarithaDevops23/roboshop-ansible  roboshop.yml -e env=dev -e role_name=frontend "
    ]
  }

