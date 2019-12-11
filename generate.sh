#!/bin/zsh
set -uo pipefail

BAK_PATH=$(cd $(dirname $0) && pwd)
MOVIES=/Users/$USER/Movies
APPLICATIONS=/Applications
STATICS=(~/.vimrc ~/.zshrc ~/.hyper.js ~/.gitconfig)

function cpCat {
    for item in ${STATICS[*]}
    do
        cp $item $BAK_PATH
    done;
}

echo "STARING 🚀 ..."
cpCat
exa -1 $APPLICATIONS > $BAK_PATH/applications.txt
exa -TL 2 $MOVIES > $BAK_PATH/movies.txt
brew list | cat > $BAK_PATH/brew.txt
brew cask list | cat > $BAK_PATH/brew_cask.txt
npm -g list --depth=0 > $BAK_PATH/npm.txt
cat ~/.npmrc | grep -v Token > $BAK_PATH/.npmrc
echo "FINISH ✅"
