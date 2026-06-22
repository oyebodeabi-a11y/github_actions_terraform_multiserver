resource "aws_vpc" "new-ec2-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "myapp-subnet-1" {
  vpc_id            = aws_vpc.new-ec2-vpc.id
  cidr_block        = var.subnet_cidr_block1
  availability_zone = var.avail_zone1
  tags = {
    Name = "${var.env_prefix}-subnet-1"
  }
}

resource "aws_subnet" "myapp-subnet-2" {
  vpc_id            = aws_vpc.new-ec2-vpc.id
  cidr_block        = var.subnet_cidr_block2
  availability_zone = var.avail_zone2
  tags = {
    Name = "${var.env_prefix}-subnet-2"
  }
}

resource "aws_subnet" "myapp-subnet-3" {
  vpc_id            = aws_vpc.new-ec2-vpc.id
  cidr_block        = var.subnet_cidr_block3
  availability_zone = var.avail_zone3
  tags = {
    Name = "${var.env_prefix}-subnet-3"
  }
}


resource "aws_internet_gateway" "myapp-igw" {
  vpc_id = aws_vpc.new-ec2-vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.new-ec2-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name = "${var.env_prefix}-main-rtb"
  }
}

# Associate Public Route Table with Public Subnet 1
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.myapp-subnet-1.id
  route_table_id = aws_default_route_table.main-rtb.id
}

# Associate Public Route Table with Public Subnet 2
resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.myapp-subnet-2.id
  route_table_id = aws_default_route_table.main-rtb.id
}

# Associate Public Route Table with Public Subnet 3
resource "aws_route_table_association" "public_assoc_3" {
  subnet_id      = aws_subnet.myapp-subnet-3.id
  route_table_id = aws_default_route_table.main-rtb.id
}