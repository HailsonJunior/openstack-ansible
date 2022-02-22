output "public_ip_controller" {
  value = aws_eip.eip-controller.id
}

output "public_ip_compute" {
  value = aws_eip.eip-compute.id
}

output "public_ip_block" {
  value = aws_eip.eip-block.id
}

output "public_ip_object" {
  value = aws_eip.eip-object.id
}