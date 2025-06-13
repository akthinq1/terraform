variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tag_name" {
  default = {
    Name = "terraform-practice"
    Purpose = "Provisoners-practice"
  }
}