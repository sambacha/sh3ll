#!/bin/bash 
# autofix shellcheck
# source: https://github.com/koalaman/shellcheck/issues/1220
# 
# shellcheck -f diff <files> | git apply
# find <directory> -type f -print0 | xargs -0 shellcheck -f diff | git apply
find . -type f -iname '*.sh' -print0 | xargs -0 -I {} -P "$(nproc)"  bash -c "shellcheck -f diff \"{}\" | git apply" || exit

