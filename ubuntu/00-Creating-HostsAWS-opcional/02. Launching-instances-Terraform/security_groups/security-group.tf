## Descomente o módulo abaixo caso o security group não tenha sido criado
## Utilize também caso a máquina em que está utilizando o Terraform não esteja na AWS
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