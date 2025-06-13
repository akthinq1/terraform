resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
#   vpc_security_group_ids = local.sg_id
  tags = var.tag_name

   provisioner "local-exec" {
     command = "echo '${self.private_ip}' > inventory"
     on_failure = continue #ignoring errors
   } 

  provisioner "local-exec" {
    command = "echo 'instance is destroyed'"
    when = destroy
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
     ]
  }

  provisioner "remote-exec" {
    when=destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }
}

resource "aws_security_group" "allow_all" {
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