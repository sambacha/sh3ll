#!/bin/sh
find .  -type f -exec chmod 644 {} \; -o -type d -exec chmod 755 {} \;
