variable "ami_id" {
    default = "ami-09c813fb71547fc4f"  
}

# variable "aws_instance" {
  
# }

variable "aws_instance_type" {
 
}

variable "aws_common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
    }  
}

variable "project" {
  default = "roboshop"
}

variable "environment" {
  
}

# SG_variables

variable "sg_name" {
    default = "allow-all"
}

variable "sg_description" {
    default = "allowing all ports from all IP"
}

variable "instances" {
    default = ["mongodb","redis"]
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    default = 0
}


variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}