variable "addition"{
  default=10+20

}

variable "list"{

default:
	[1,2,3,4]
}

variable "map"{}

output "sample" {
 value = var.list
}