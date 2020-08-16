#!/bin/bash
# replace .npmrc with anything else
for layer in */layer.tar; do tar -tf $layer | grep -w .npmrc && echo $layer; done
