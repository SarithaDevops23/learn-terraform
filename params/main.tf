resource "aws_ssm_parameter" "params" {
  for_each = var.params
  name  = each.value.name
  type  = each.value.type
  value = each.value.value
}

variable "params"{

	default=[
			{name = "demo1", type="String", value = "demo1"},
			{name = "demo2", type="String", value = "demo2"}

]


