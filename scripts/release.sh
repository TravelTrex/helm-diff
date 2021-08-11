#!/usr/bin/env bash
set -x

if [ ! -f /go/bin/github-release ]; then
  go get github.com/github-release/github-release
fi

user=TravelTrex
repo=helm-diff
tag=$1
commit=$2

github-release release -u $user -r $repo -t $tag -c $commit -n $tag

for f in $(ls release); do
  github-release upload -u $user -r $repo -t $tag -n $f -f release/$f
done
