#!/bin/bash

set -e

VERSION=$1
TAG=${2:-latest}

if [ "$#" -ne 2 ]
then
  echo 'Usage: Supply a version and a tag 
       ./publish.sh (<newversion> | major | minor | patch | premajor | preminor | prepatch | prerelease | from-git) (tag)
       
       Eg: ./publish.sh prerelease next'
  exit 1
fi

echo "Version : $VERSION"
echo "Tag $TAG"
