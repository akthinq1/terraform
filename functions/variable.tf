variable "ami_id" {
  type        = string
  description = "AMI ID got from JoinDevOps RHEL 9"
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type_t2" {
    default = "t2.micro"
}

variable "instance_type_t3" {
  default = "t3.micro"  
}

variable "db" {
  default = ["mongodb", "mysql"]
}

variable "instances" {
    default = ["mongodb", "catalogue", "cart", "frontend"]
}
