resource "aws_instance" "roboshop" {
  count = 4
  ami           = var.ami_id
  instance_type = var.db == var.db[0] ? var.instance_type_t3:var.instance_type_t2
  vpc_security_group_ids = [ aws_security_group.allow_all_tf.id ]

  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_security_group" "allow_all_tf" {
    name        = "allow_all"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all"
    }
}