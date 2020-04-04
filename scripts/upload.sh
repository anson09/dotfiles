set -e

./generate.sh
git add --all
git commit -m  "build: `date '+%Y-%m-%d %H:%M:%S'`"
git push