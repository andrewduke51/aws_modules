#!/bin/bash

apt-get update \
apt-get install software-properties-common \
add-apt-repository ppa:ethereum/ethereum \
apt-get update \
apt-get install ethminer \

ethminer -C -F http://eth.pool.minergate.com:55751/${email_address} --disable-submit-hashrate