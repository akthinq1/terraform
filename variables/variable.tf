variable "ami_id" {
  type        = string
  description = "AMI ID got from JoinDevOps RHEL 9"
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    default = "t3.micro"
}
