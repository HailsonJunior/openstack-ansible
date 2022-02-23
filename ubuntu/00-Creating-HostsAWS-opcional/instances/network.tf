resource "aws_vpc" "openstack-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "openstack-subnet" {
  cidr_block = "10.0.80.0/20"
  vpc_id     = aws_vpc.openstack-vpc.id
}

resource "aws_security_group" "openstack-sg" {
  name   = "openstack-sg"
  vpc_id = aws_vpc.openstack-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "eip-controller" {
  instance = aws_spot_instance_request.controller.spot_instance_id
  vpc      = true
}

resource "aws_eip" "eip-compute" {
  instance = aws_spot_instance_request.compute.spot_instance_id
  vpc      = true
}

resource "aws_eip" "eip-block" {
  instance = aws_spot_instance_request.block.spot_instance_id
  vpc      = true
}

resource "aws_eip" "eip-object" {
  instance = aws_spot_instance_request.object.spot_instance_id
  vpc      = true
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.openstack-vpc.id
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.openstack-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }
}

resource "aws_route_table_association" "subnet-association" {
  provider = aws

  subnet_id      = aws_subnet.openstack-subnet.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_network_interface" "network-controller" {
  subnet_id       = aws_subnet.openstack-subnet.id
  private_ips     = ["10.0.80.40"]
  security_groups = [aws_security_group.openstack-sg.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "network-compute" {
  subnet_id       = aws_subnet.openstack-subnet.id
  private_ips     = ["10.0.80.43"]
  security_groups = [aws_security_group.openstack-sg.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "network-block" {
  subnet_id       = aws_subnet.openstack-subnet.id
  private_ips     = ["10.0.80.44"]
  security_groups = [aws_security_group.openstack-sg.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "network-object" {
  subnet_id       = aws_subnet.openstack-subnet.id
  private_ips     = ["10.0.80.46"]
  security_groups = [aws_security_group.openstack-sg.id]

  tags = {
    Name = "primary_network_interface"
  }
}