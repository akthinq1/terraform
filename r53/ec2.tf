resource "aws_instance" "roboshop" {
  count = 4
  ami           = var.ami_id
  instance_type = var.environmet == "dev" ? "t2.micro": "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all_tf.id ]

  tags = {
    Name = var.instance_name[count.index]
  }
}

resource "aws_security_group" "allow_all_tf" {
    name        = var.sg_name
    description = var.sg_desc

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}