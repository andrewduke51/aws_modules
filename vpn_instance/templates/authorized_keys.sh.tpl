#!/bin/bash
# This is a simple shell script to add pub ssh key

AUTH_CONF="/home/ubuntu/.ssh/authorized_keys"
HOSTNAME=`curl -s http://169.254.169.254/latest/meta-data/hostname`
LOCAL_HOSTNAME=`curl -s http://169.254.169.254/latest/meta-data/local-hostname`
VPN_IP_INTERNAL=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
VPN_IP_EXTERNAL=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4`

# Swap out variables in IPSEC_CONF

# Add ssh key
/bin/echo "${public_ssh_key}" >> $AUTH_CONF
chmod 400 /home/ubuntu/.ssh/id_rsa
/usr/sbin/service ssh restart

#################################HOSTNAME#################
//SHORT_NAME=$(echo "$HOSTNAME" | cut -d. -f1)
//echo "10.51.1.34 webserver2" >> /etc/hosts
//echo "$VPN_IP_INTERNAL $SHORT_NAME" >> /etc/hosts
///bin/sed -i "s:$SHORT_NAME:$LOCAL_HOSTNAME:g" /etc/hostname
//
//#######
//# VPN #
//#######
//
//cat <<EOF >> /etc/network/interfaces.d/50-cloud-init.cfg
//################### Network configurartion #########################
//#These lines, or something similar to them, should already exist
//auto lo
//iface lo inet loopback
//
//auto eth0
//iface eth0 inet dhcp
//
//#We need to add the lines below this one
//auto eth0:1
//iface eth0:1 inet static
//  address $VPN_IP_INTERNAL
//  netmask 255.255.255.0
//  dns-nameservers 10.51.0.2
//EOF
//
//##########################################
//# Swap out variables in /etc/sysctl.conf #
//##########################################
///bin/sed -i "s:#net.ipv4.ip_forward=1:net.ipv4.ip_forward=1:g" /etc/sysctl.conf
///bin/sed -i "s:#net.ipv4.conf.all.accept_redirects = 0:net.ipv4.conf.all.accept_redirects = 0:g" /etc/sysctl.conf
///bin/sed -i "s:#net.ipv4.conf.all.send_redirects = 0:net.ipv4.conf.all.send_redirects = 0:g" /etc/sysctl.conf
//
//sysctl -p /etc/sysctl.conf
//
//####################OPENVPN#################
//sudo apt-get install -y openvpn
//sudo modprobe iptable_nat
//echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
//sudo iptables -t nat -A POSTROUTING -s 10.4.0.1/2 -o eth0 -j MASQUERADE
//sudo iptables -t nat -A POSTROUTING -s 10.51.0.0/16 -o eth0 -j MASQUERADE
//sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
//
//cd /etc/openvpn
//sudo openvpn --genkey --secret ovpn.key
//
//cat <<EOF >> /etc/openvpn/openvpn.conf
//################### VPN config #########################
//port 1194
//proto tcp-server
//dev tun1
//ifconfig 10.4.0.1 10.4.0.2
//status server-tcp.log
//verb 3
//secret  ovpn.key
//EOF
//
//sudo service openvpn start
//sudo chmod 777 ovpn.key