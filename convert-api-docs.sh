#!/bin/bash
# Convert to TSV
# Note -r flag
# to_entries creates an array of key,value maps, the trailing [] converts this array to stream items
cat api-docs.json | jq -r '.paths | to_entries[] | .key as $path | .value | to_entries[] | [.key,$path,.value.tags[0]] | @tsv'

# Transform into different JSON...
cat api-docs.json | jq '[ .paths | to_entries[] | .key as $path | .value | to_entries[] | { path:$path, method:.key, tag:.value.tags[0] } ]'
