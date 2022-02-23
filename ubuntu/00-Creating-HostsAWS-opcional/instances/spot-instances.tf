resource "aws_spot_instance_request" "controller" {
  instance_type        = "c5.xlarge"
  ami                  = var.ami
  user_data            = file("init-script.sh")
  key_name             = aws_key_pair.my-key.key_name
  wait_for_fulfillment = true

  network_interface {
    network_interface_id = aws_network_interface.network-controller.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Controller"
  }
}

resource "aws_spot_instance_request" "compute" {
  instance_type        = "c5.xlarge"
  ami                  = var.ami
  user_data            = file("init-script.sh")
  key_name             = aws_key_pair.my-key.key_name
  wait_for_fulfillment = true

  network_interface {
    network_interface_id = aws_network_interface.network-compute.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Compute"
  }
}

resource "aws_spot_instance_request" "block" {
  instance_type        = "c5.large"
  ami                  = var.ami
  user_data            = file("init-script.sh")
  key_name             = aws_key_pair.my-key.key_name
  wait_for_fulfillment = true

  network_interface {
    network_interface_id = aws_network_interface.network-block.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdd"
    volume_size           = var.block_size_sdd
    delete_on_termination = true
  }

  tags = {
    Projeto = "OpenStack"
    Name    = "Block Storage"
  }
}

resource "aws_spot_instance_request" "object" {
  instance_type        = "c5.large"
  ami                  = var.ami
  user_data            = file("init-script.sh")
  key_name             = aws_key_pair.my-key.key_name
  wait_for_fulfillment = true

  network_interface {
    network_interface_id = aws_network_interface.network-object.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.block_size
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdd"
    volume_size           = var.block_size_sdd
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sde"
    volume_size           = var.block_size_sdd
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
