resource "aws_vpc" "openstack-vpc" {
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "openstack-vpc"
    }  
}

resource "aws_subnet" "openstack-subnet" {
    vpc_id = aws_vpc.openstack-vpc
    cidr_block = "10.0.0.0/20"
    availability_zone = "us-east-1a"  

    tags = {
      "Name" = "openstack-subnet"
    }
}

resource "aws_network_interface" "controller-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.11" ]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "compute-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.31" ]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "block1-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.41" ]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "object1-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.51" ]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "object2-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.52" ]

    tags = {
      "Name" = "primary_network_interface"
    }
}