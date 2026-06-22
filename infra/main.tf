resource "aws_instance" "nginx-server" {
  #ami                         = data.aws_ami.latest-amazon-linux-image.id
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "abi"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone1
  associate_public_ip_address = true
  user_data                   = file("install-nginx.sh")
  tags = {
    Name = "${var.env_prefix}-Nginx-server"
  }
}

resource "aws_instance" "jenkins-server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "abi"
  subnet_id                   = aws_subnet.myapp-subnet-2.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone2
  associate_public_ip_address = true
  user_data                   = file("jenkins.sh")
  tags = {
    Name = "${var.env_prefix}-jenkins-server"
  }
}
resource "aws_instance" "apache-server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "abi"
  subnet_id                   = aws_subnet.myapp-subnet-3.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone3
  associate_public_ip_address = true
  user_data                   = file("apache.sh")
  tags = {
    Name = "${var.env_prefix}-apache-server"
  }
}