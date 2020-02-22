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
  default = "nirmal-tf"
}

variable "ssh_key_private" {
  default = "nirmal-tf.pem"
}
