resource "aws_instance" "openstack_hosts_xlarge" {
    for_each = {
        node1 = {
            name = "Controller"
            
        }
        node2 = {
            name = "Compute"
        }
    }

    instance_type = "t2.xlarge"
    ami = var.ami
    key_name = "${aws_key_pair.my-key.key_name}"
    security_groups = ["Iac_group"]  

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
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
    }

    instance_type = "t2.micro"
    ami = var.ami
    key_name = "${aws_key_pair.my-key.key_name}"
    security_groups = ["Iac_group"]  

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
        delete_on_termination = true
    }

    tags = {
      Projeto = "OpenStack"
      Name = "${each.key}: ${lookup(each.value, "name", null)}"
    }
}

resource "aws_key_pair" "my-key" {
    key_name = "my-key"
    public_key = "${file("~/.ssh/id_rsa.pub")}"
}
