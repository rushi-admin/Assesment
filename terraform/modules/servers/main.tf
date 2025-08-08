resource "aws_security_group" "ssh" {
  name = "${var.name}-ssh"
  vpc_id = var.vpc_id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "public" {
  count = var.public_count
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = element(var.public_subnet_ids, count.index % length(var.public_subnet_ids))
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]
  associate_public_ip_address = true
  tags = { Name = "${var.name}-public-${count.index}" }
}

resource "aws_instance" "private" {
  count = var.private_count
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = element(var.private_subnet_ids, 0)
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]
  associate_public_ip_address = false
  tags = { Name = "${var.name}-private-${count.index}" }
}

output "public_ips" { value = aws_instance.public[*].public_ip }
output "private_ips" { value = aws_instance.private[*].private_ip }
