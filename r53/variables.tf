variable "ami_id" {
    type = string
  default = "ami-09c813fb71547fc4f"
  description = "AMI ID"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = ["mongodb", "mysql", "frontend", "catalogue"]
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_desc" {
  default = "allow all ports from internet"
}

variable "sg_tags" {
    default = {
        name="allow-all"
    }  
}

variable "environmet" {
  default = "dev"
}