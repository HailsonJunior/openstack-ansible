resource "aws_instance" "controller" {
  instance_type = "t2.xlarge"
  ami           = var.ami
  user_data     = file("init-script.sh")
  key_name      = aws_key_pair.my-key.key_name
  network_interface {
    network_interface_id = aws_network_interface.network-controller.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    volume_type           = var.block_type
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Controller"
  }
}

resource "aws_instance" "compute" {
  instance_type = "t2.xlarge"
  ami           = var.ami
  user_data     = file("init-script.sh")
  key_name      = aws_key_pair.my-key.key_name
  network_interface {
    network_interface_id = aws_network_interface.network-compute.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    volume_type           = var.block_type
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Compute"
  }
}

resource "aws_instance" "block" {
  instance_type = "t2.medium"
  ami           = var.ami
  user_data     = file("init-script.sh")
  key_name      = aws_key_pair.my-key.key_name
  network_interface {
    network_interface_id = aws_network_interface.network-block.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    volume_type           = var.block_type
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdd"
    volume_size           = var.block_size_sdd
    volume_type           = var.block_type
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Block Storage"
  }
}

resource "aws_instance" "object" {
  instance_type = "t2.medium"
  ami           = var.ami
  user_data     = file("init-script.sh")
  key_name      = aws_key_pair.my-key.key_name
  network_interface {
    network_interface_id = aws_network_interface.network-object.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    volume_type           = var.block_type
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdd"
    volume_size           = var.block_size_sdd
    volume_type           = var.block_type
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sde"
    volume_size           = var.block_size_sdd
    volume_type           = var.block_type
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Object Storage"
  }
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
