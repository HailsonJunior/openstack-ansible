resource "aws_instance" "openstack_hosts" {
    for_each = {
        controller = {
            name = "Controller"
            
        }
        storage = {
            name = "Storage"
        }
    }

    instance_type = "t2.micro"
    ami = "ami-0cb5f8e033cfa84d2"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]

    tags = {
      Projeto = "OpenStack"
      Name = "${each.key}: ${lookup(each.value, "name", null)}"
    }
    
}
resource "aws_key_pair" "key_openstack" {
    key_name = "key_openstack"
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}" # Altere o caminho da chave pública de acordo com o usuário
}