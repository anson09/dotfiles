#!/bin/bash
set -uo pipefail

BAK_PATH=$(cd $(dirname $0)/../config && pwd)
USER_PATH=/Users/anson
APPLICATIONS=/Applications
STATICS=($USER_PATH/.vimrc $USER_PATH/.zshrc $USER_PATH/.gitconfig /etc/hosts /usr/local/etc/nginx/nginx.conf)

echo "STARING 🚀 ..."
cp ${STATICS[*]} $BAK_PATH
exa -1 $APPLICATIONS > $BAK_PATH/applications.txt
HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump
mv Brewfile $BAK_PATH
ls /usr/local/lib/node_modules | grep -v npm$ > $BAK_PATH/npm.txt
cat ~/.npmrc | grep -v Token > $BAK_PATH/.npmrc
echo "FINISH ✅"
