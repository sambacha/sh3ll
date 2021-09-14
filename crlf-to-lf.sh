#!/usr/bin/env bash
# properly convert CRLF to LF 
# -i writes back to file
perl -pei 'if ( s/\r\n?/\n/g ) { $f=1 }; if ( $f || ! $m ) { s/([^\n])\z/$1\n/ }; $m=1' "$@"
