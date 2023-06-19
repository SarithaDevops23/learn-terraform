variable "addition"{
  default=10+20

}

variable "list"{

default=[1,2,3,4]
}

variable "map"{
	default={
	fruits={
	a="apple"
	b:"banana"
	}
	choco={
	a="kitkat"
	b="dairymilk"
	}
	
	}
}

output "sample" {
 value = var.map
}