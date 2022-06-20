resource "aws_security_group" "web" {
  name        = "${var.prefix}-web-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  tags = {
    Name = "${var.prefix}-web-sg"
  }
}

resource "aws_security_group_rule" "ssh_web" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.sourceip]
  security_group_id = aws_security_group.web.id
}

resource "aws_security_group_rule" "http_web" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}

resource "aws_security_group_rule" "web_egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}