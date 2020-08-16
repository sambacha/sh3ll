#!/bin/sh

for filename in ./*; do mv "./$filename" "./$(echo "$filename" | sed -e 's/<FILE_NAME_PORTION_TO_REMOVE>//g')";  done
