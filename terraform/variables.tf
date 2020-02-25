# AWS Config

variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "aws_region" {
  default = "us-west-2"
}

variable "key_pair" {
  default = "your_key_name"
}

variable "ssh_key_private" {
  default = "path_to_your_key.pem"
}
