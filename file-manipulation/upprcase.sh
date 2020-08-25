#!/bin/bash

for i in *.txt
do 
    fname=$(echo $i | cut -d"." -f1 | tr [a-z] [A-Z])
    ext=$(echo $i | cut -d"." -f2)
    mv $i $fname.$ext
done
