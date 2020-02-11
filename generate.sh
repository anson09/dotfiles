#!/bin/zsh
set -uo pipefail

# TODO split src and data in dir

BAK_PATH=$(cd $(dirname $0) && pwd)
MOVIES=/Users/$USER/Movies
APPLICATIONS=/Applications
STATICS=(~/.vimrc ~/.zshrc ~/.hyper.js ~/.gitconfig /etc/hosts /usr/local/etc/nginx/nginx.conf)

function cpCat {
    for item in ${STATICS[*]}
    do
        cp $item $BAK_PATH
    done;
}

echo "STARING 🚀 ..."
cpCat
exa -1 $APPLICATIONS > $BAK_PATH/applications.txt
brew list | cat > $BAK_PATH/brew.txt
brew cask list | cat > $BAK_PATH/brew_cask.txt
npm -g list --depth=0 > $BAK_PATH/npm.txt
cat ~/.npmrc | grep -v Token > $BAK_PATH/.npmrc
echo "FINISH ✅"
