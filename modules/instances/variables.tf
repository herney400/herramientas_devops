# modules/instances/variables.tf
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "mongodb_ami" {
  type    = string
  default = "ami-0a7d80731ae1b2435" # Ubuntu 20.04 LTS (ajustar según tu región)
}

variable "nodejs_ami" {
  type    = string
  default = "ami-0a7d80731ae1b2435" # Ubuntu 20.04 LTS
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "public_key_path" {
  type    = string
  default = ""
}
