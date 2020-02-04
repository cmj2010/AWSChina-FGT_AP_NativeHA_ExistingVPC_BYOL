resource "aws_iam_role" "iam-role2" {
  name = "${var.tag_name_prefix}-iam-role2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com.cn"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "iam-instance-profile2" {
  name = "${var.tag_name_prefix}-iam-instance-profile2"
  role = "${var.tag_name_prefix}-iam-role2"
}

resource "aws_iam_role_policy" "iam-role-policy2" {
  name = "${var.tag_name_prefix}-iam-role-policy2"
  role = aws_iam_role.iam-role2.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
		"ec2:Describe*",
		"ec2:AssociateAddress",
		"ec2:AssignPrivateIpAddresses",
		"ec2:UnassignPrivateIpAddresses",
		"ec2:ReplaceRoute"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_security_group" "secgrp" {
  name        = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-secgrp"
  description = "secgrp"
  vpc_id      = var.vpc_id
  ingress {
    description = "Allow remote access to FGT"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_for_access]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-secgrp"
  }
}

resource "aws_network_interface" "eni0" {
  subnet_id         = var.public_subnet2_id
  security_groups   = [aws_security_group.secgrp.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-eni0"
  }
}

resource "aws_network_interface" "eni1" {
  subnet_id         = var.private_subnet2_id
  security_groups   = [aws_security_group.secgrp.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-eni1"
  }
}

resource "aws_network_interface" "eni2" {
  subnet_id         = var.ha_subnet2_id
  security_groups   = [aws_security_group.secgrp.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-eni2"
  }
}

resource "aws_network_interface" "eni3" {
  subnet_id         = var.mgt_subnet2_id
  security_groups   = [aws_security_group.secgrp.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-eni3"
  }
}

resource "aws_eip" "eip2" {
  vpc               = true
  network_interface = aws_network_interface.eni3.id
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}-mgt"
  }
}

resource "aws_instance" "fgt" {
  ami                  = var.ami
  instance_type        = var.instance_type
  availability_zone    = var.availability_zone
  key_name             = var.keypair
  iam_instance_profile = aws_iam_instance_profile.iam-instance-profile2.id
  user_data            = var.user_data
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.eni0.id
  }
  network_interface {
    device_index         = 1
    network_interface_id = aws_network_interface.eni1.id
  }
  network_interface {
    device_index         = 2
    network_interface_id = aws_network_interface.eni2.id
  }
  network_interface {
    device_index         = 3
    network_interface_id = aws_network_interface.eni3.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-fgt${var.tag_name_unique}"
  }
}
