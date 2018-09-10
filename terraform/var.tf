variable "region" { default = "eu-west-1" }
variable "aws_profile" { default = "r00k" }
variable "key_name" { default = "r00k" }
variable "security_group_id" {}


variable "amis" {
  type = "map"
  default = { "eu-west-1" = "ami-5f76b626" }
}
