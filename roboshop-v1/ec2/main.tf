resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.name
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
      "ansible-pull -i localhost, -U  https://github.com/SarithaDevops23/roboshop-ansible  roboshop.yml -e env=dev -e role_name=${var.name}"
    ]
  }
 }

 resource "aws_route53_record" "www" {
  zone_id = "Z10122602VAB0LEU37V8Y"
  name    = "${var.name}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.web.private_ip]
}
  data "aws_ami" "example" {
  owners = ["973714476881"] 
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
 }

 resource "aws_security_group" "sg" {
  name        = "allow-all"
  description = "Allow TLS inbound traffic"
  

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   tags = {
    Name = "allow-all"
  }

  }

  variable "name"{}

 