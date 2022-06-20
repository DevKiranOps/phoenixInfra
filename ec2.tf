resource "aws_key_pair" "mainkey" {
  key_name   = "myops"
  public_key = file(var.publicKeyPath)
}

data "template_file" "web_userdata" {
  template = file("${path.module}/Templates/web-cloudinit.tpl")
}

data "aws_ami" "myubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_network_interface" "web" {
  subnet_id = aws_subnet.web.id

  security_groups = [aws_security_group.web.id]

}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.myubuntu.id
  instance_type               = var.webInstanceSize
  key_name                    = aws_key_pair.mainkey.key_name
  user_data                   = base64encode(data.template_file.web_userdata.rendered)
  user_data_replace_on_change = true
  network_interface {
    network_interface_id = aws_network_interface.web.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    Name        = "${var.prefix}-web"
    Environment = var.env
    Project     = var.project
  }
}


output "ec2_public_ip" {
  value = aws_instance.web.public_ip

}
