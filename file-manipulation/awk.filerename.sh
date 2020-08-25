#!/bin/bash

for i in *.txt; do

    mv "$i" $(echo "$i" | awk '{ sub(/.txt$/,""); print toupper($0) ".txt" }');
done
