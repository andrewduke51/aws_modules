output "public_address" {
  value = "${aws_instance.vpn_instance.public_ip}"
}
