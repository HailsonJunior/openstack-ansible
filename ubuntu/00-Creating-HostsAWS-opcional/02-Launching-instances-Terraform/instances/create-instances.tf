resource "aws_instance" "openstack_hosts_large" {
    for_each = {
        node1 = {
            name = "Controller"
            
        }
        node2 = {
            name = "Compute"
        }
    }

    instance_type = "t2.large"
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

    instance_type = "t2.medium"
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
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}" # Altere o caminho da chave pública de acordo com o usuário
}
