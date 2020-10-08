#!/bin/bash
sudo apt update 
wget https://luarocks.org/releases/luarocks-3.3.1.tar.gz
tar zxpf luarocks-3.3.1.tar.gz
cd luarocks-3.3.1
./configure && make && sudo make install
sudo luarocks install luasocket
lua
