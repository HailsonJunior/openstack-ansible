resource "aws_instance" "controller" {
    instance_type = "t2.micro"
    ami = "ami-0cb5f8e033cfa84d2"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    network_interface {
      network_interface_id = aws_network_interface.controller-network.id
      device_index = 0
    }

    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "controller"
    }
}

resource "aws_instance" "compute" {
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
        Name = "controller"
    }
}

resource "aws_instance" "block1" {
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
        Name = "block 1"
    }
}

resource "aws_instance" "object1" {
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
        Name = "object 1"
    }
}

resource "aws_instance" "object2" {
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
        Name = "object 2"
    }
}
resource "aws_key_pair" "key_openstack" {
    key_name = "key_openstack"
    public_key = "IaC.pem"
}

module "vpc" {
    source = "../vpc"
}
