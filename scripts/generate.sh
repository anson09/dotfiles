#!/bin/bash
set -uo pipefail

BAK_PATH=$(cd $(dirname $0)/../config && pwd)
USER_PATH=/Users/anson
APPLICATIONS=/Applications
STATICS=($USER_PATH/.vimrc $USER_PATH/.zshrc $USER_PATH/.hyper.js $USER_PATH/.gitconfig /etc/hosts /usr/local/etc/nginx/nginx.conf)

echo "STARING 🚀 ..."
cp ${STATICS[*]} $BAK_PATH
exa -1 $APPLICATIONS > $BAK_PATH/applications.txt
brew list | cat > $BAK_PATH/brew.txt
brew cask list | cat > $BAK_PATH/brew-cask.txt
ls /usr/local/lib/node_modules | grep -v npm > $BAK_PATH/npm.txt
cat ~/.npmrc | grep -v Token > $BAK_PATH/.npmrc
echo "FINISH ✅"
