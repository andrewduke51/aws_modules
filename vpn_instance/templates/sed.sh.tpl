#!/bin/bash

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethminer

ethminer -C -F http://eth.pool.minergate.com:55751/${email_address} --disable-submit-hashrate