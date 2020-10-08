#!/bin/bash
sudo apt update 
curl -R -O http://www.lua.org/ftp/lua-5.4.0.tar.gz
tar zxf lua-5.4.0.tar.gz
cd lua-5.4.0 || exit
make all test
cd $HOME || exit
wget https://luarocks.org/releases/luarocks-3.3.1.tar.gz
tar zxpf luarocks-3.3.1.tar.gz
cd luarocks-3.3.1 || exit
./configure && make && sudo make install
sudo luarocks install luasocket
lua
