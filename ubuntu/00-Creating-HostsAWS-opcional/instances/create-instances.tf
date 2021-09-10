resource "aws_instance" "openstack_hosts_large" {
    for_each = {
        node1 = {
            name = "Controller"
            network_interface {
                network_interface_id = aws_network_interface.controller-network.id
                device_index         = 0
            }
        }
        node2 = {
            name = "Compute"
        }
    }

    instance_type = "t2.micro"
    ami = "ami-0cb5f8e033cfa84d2"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]  

    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
    
    tags = {
      Projeto = "OpenStack"
      Name = "${each.key}: ${lookup(each.value, "name", null)}"
    }
}

resource "aws_instance" "openstack_hosts_medium" {
    for_each = {
        node3 = {
            name = "Block Storage Node 1"
            
        }
        node4 = {
            name = "Object Storage Node 1"
        }
        node5 = {
            name = "Object Storage Node 2"
        }
    }

    instance_type = "t2.micro"
    ami = "ami-0cb5f8e033cfa84d2"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]  

    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }

    tags = {
      Projeto = "OpenStack"
      Name = "${each.key}: ${lookup(each.value, "name", null)}"
    }
}
resource "aws_key_pair" "key_openstack" {
    key_name = "key_openstack"
    public_key = "IaC.pem"
}

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
