provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_vpc" "terraformvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraformvpc.id
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-vpc"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.public_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-public-subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.public_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-public-subnet2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.private_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-private-subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.private_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-private-subnet2"
  }
}

resource "aws_subnet" "ha_subnet1" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.ha_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-ha-subnet1"
  }
}

resource "aws_subnet" "ha_subnet2" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.ha_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-ha-subnet2"
  }
}

resource "aws_subnet" "mgt_subnet1" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.mgt_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-mgt-subnet1"
  }
}

resource "aws_subnet" "mgt_subnet2" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = var.mgt_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-mgt-subnet2"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraformvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terraformvpc.id
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-private-rt"
  }
}

resource "aws_route_table_association" "public_rt_association1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "public_rt_association3" {
  subnet_id      = aws_subnet.mgt_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association4" {
  subnet_id      = aws_subnet.mgt_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

