## Descomente o módulo abaixo caso o security group não tenha sido criado
## O security group deve ser o mesmo do host pelo qual estamos criando os hosts do OpenStack
## Lembre-se de liberar acesso entre as máquinas no security group

#resource "aws_security_group" "mygroup" {
#    name = "mygroup"
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