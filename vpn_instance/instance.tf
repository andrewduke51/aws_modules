################################ Templates
data "template_file" "add_ssh_auth" {
  template = "${file("${path.module}/templates/authorized_keys.sh.tpl")}"

  vars {
    public_ssh_key = "${var.public_ssh_key}"
  }
}

data "template_file" "add_vpn_sh" {
  template = "${file("${path.module}/templates/vpn_setup.sh.tpl")}"

  vars {
    vpn_username = "${var.vpn_username}"
    vpn_password = "${var.vpn_password}"
    ip_sec_key   = "${var.ip_sec_key}"
  }
}

############################user_data parts
data "template_cloudinit_config" "init" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "get_auth.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.add_ssh_auth.rendered}"
  }

  part {
    filename     = "vpn_sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.add_vpn_sh.rendered}"
  }
}

######### Instance

resource "aws_instance" "vpn_instance" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = "${split(",", "${var.security_group_ids}")}"
  subnet_id              = "${var.subnet_id}"

  user_data                   = "${data.template_cloudinit_config.init.rendered}"
  associate_public_ip_address = true
  source_dest_check           = false

  # Copies the id_rsa file to /home/ubuntu/.ssh/id_rsa
  provisioner "file" {
    source      = "${var.private_ssh_key}"
    destination = "${var.destination_path}"

    connection {
      private_key = "${file("${var.private_ssh_key}")}"
      user        = "ubuntu"
    }
  }

  # Copies VPN bash script
  provisioner "file" {
    source      = "${path.module}/templates/configure_ipsec.sh.tpl"
    destination = "/tmp/configure_ipsec.sh.tpl"

    connection {
      private_key = "${file("${var.private_ssh_key}")}"
      user        = "ubuntu"
    }
  }

  #dependencies and build
  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/.ssh/id_rsa",
      "mv /tmp/configure_ipsec.sh.tpl /tmp/configure_ipsec.temp",
    ]

    connection {
      private_key = "${file("${var.private_ssh_key}")}"
      user        = "ubuntu"
    }
  }

  tags {
    Name        = "${var.instance_name}"
    env         = "${var.env}"
    os          = "ubuntu16"
    os_family   = "linux"
    servicename = "vpn"
    tier        = "${var.env}"
  }
}
