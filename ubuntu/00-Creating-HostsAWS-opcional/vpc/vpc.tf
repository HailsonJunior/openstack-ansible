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