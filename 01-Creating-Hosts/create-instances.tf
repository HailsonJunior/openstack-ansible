resource "aws_instance" "controller" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]
     
    tags = {
        Name = "Teste instancia"
    }
}

# Altere o caminho da chave pública de acordo com o usuário
resource "aws_key_pair" "key_openstack" {
    key_name = "key_openstack"
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}"
}

#
## Descomente caso o security group não tenha sido criado
## O security group deve ser o mesmo do host pelo qual estamos criando os hosts do OpenStack
## Lembre-se de liberar acesso entre as máquinas no security group
#
#resource "aws_security_group" "Iac_group" {
#    name = "Iac_group"
#    ingress {
#        from_port = 22
#        to_port = 22
#        protocol = "tcp"
#        cidr_blocks = ["IP-SERVER/32"]
#    }
#    egress {
#        from_port = 0
#        to_port = 0
#        protocol = -1
#        cidr_blocks = ["0.0.0.0/0"]
#    }
#}