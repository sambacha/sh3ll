#!/bin/bash 

git fetch -u . refs/remotes/origin/:refs/heads/

git remote rm origin

git fast-export --show-original-ids --reference-excluded-parents --fake-missing-tagger --signed-tags=strip --tag-of-filtered-object=rewrite --use-done-feature --no-data --reencode=yes --mark-tags --all | filter | git -c core.ignorecase=false fast-import --force --quiet

git update-ref --no-deref --stdin 
# fed with a list of refs to nuke, and a list of replace refs to delete, create, or update.

git reset --hard

git reflog expire --expire=now --all

git gc --prune=now
