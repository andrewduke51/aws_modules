output "public_address" {
  value = aws_instance.ec2.*.public_ip
}