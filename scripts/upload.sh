#!/bin/bash
set -e

cd $(dirname $0)
./generate.sh
git add --all
git commit -m  "build: `date '+%Y-%m-%d %H:%M:%S'`"
git push
