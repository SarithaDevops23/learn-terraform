module "instances"{
for_each =var.instances
source = "./ec2"
name = each.key
}

variable "instsances"{

	default={
		frontend={}
		mongodb={}
		catatlogue={}
		redis={}
		user={}
		cart={}
		mysql={}
		shipping={}
		payment={}
		rabbitmq={}
		dispatch={}
		

	}
}


