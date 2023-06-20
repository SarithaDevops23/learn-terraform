module "sample1"{
source = "./ec2"
name = "M1"
}

module "sample2"{
source = "./ec2"
name= "M2"
}

output "M1"{
	value=module.sample1.public_ip
}

output "M2"{
	value=module.sample2.public_ip
}
