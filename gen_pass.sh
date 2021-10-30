#!/bin/bash
function genpass {
  isint="^[1-9][0-9]*$"
  [[ $1 =~ $isint ]] && count=$1 || count=1
  [[ $2 =~ $isint ]] && len=$2   || len=10
  for i in $(seq 1 $count); do </dev/urandom tr -dc A-Za-z0-9 | head -c$len ; echo ; done
}
