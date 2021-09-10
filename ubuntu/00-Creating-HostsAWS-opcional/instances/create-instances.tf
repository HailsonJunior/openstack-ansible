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

resource "aws_instance" "controller" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    network_interface {
      network_interface_id = aws_network_interface.controller-network.id
      device_index = 0
    }

    root_block_device {
        volume_size = block_size
        volume_type = block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "controller"
    }
}

resource "aws_instance" "compute" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    root_block_device {
        volume_size = block_size
        volume_type = block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "compute"
    }
}

resource "aws_instance" "block1" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    root_block_device {
        volume_size = block_size
        volume_type = block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "block 1"
    }
}

resource "aws_instance" "object1" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    root_block_device {
        volume_size = block_size
        volume_type = block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "object 1"
    }
}

resource "aws_instance" "object2" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    root_block_device {
        volume_size = block_size
        volume_type = block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "object 2"
    }
}
resource "aws_key_pair" "key_openstack" {
    key_name = "key_openstack"
    public_key = "IaC.pem"
}