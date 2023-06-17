variable "addition"{
  default=10+20

}

output "sample" {
 value = var.addition
}