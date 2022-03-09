#!/bin/bash

function loopOverArray(){

   restic snapshots --json | jq -r '.' | jq -c '.[]'| while read i; do
    id=$(echo $i | jq -r '.| .short_id')
    ctime=$(echo $i | jq -r '.| .time')
    hostname=$(echo $i | jq -r '.| .hostname')
    paths=$(echo $i | jq -r '. | .paths | join(,)')
    tagss=$(echo $i | jq -r '. | .tags | join(,)')
    printf %-10s - %-40s - %-20s - %-30s - %-20s\n $id $ctime $hostname $paths $tags
    done
}

loopOverArray
exit 0
