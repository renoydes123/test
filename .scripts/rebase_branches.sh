#!/bin/bash

set -euxa pipefail

branches=$(cat .scripts/branches)

echo "$branches" | while read branch
do
  git checkout "$branch"
  git pull --rebase origin main
  git push origin "$branch" --force-with-lease
done

git checkout main