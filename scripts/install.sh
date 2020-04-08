#!/bin/bash
set -euo pipefail

CONFIG_PATH=$(cd $(dirname $0)/../config && pwd)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

brew tap homebrew/cask-fonts 

brew update

cat $CONIFG_PATH/brew.txt | xargs brew install
cat $CONIFG_PATH/brew-cask.txt | xargs brew cask install

/usr/local/opt/fzf/install
mkcert -install

# npm
cat $NPM_LIST_PATH/npm.txt | xargs npm -g install 

# conifg
cp $CONFIG_PATH/.gitconfig $CONFIG_PATH/.hyper.js $CONFIG_PATH/.npmrc $CONFIG_PATH/.vimrc $CONFIG_PATH/.zshrc ~/
echo "-> enter password to replace hosts file" 
cp $CONFIG_PATH/hosts /etc/
cp $CONFIG_PATH/nginx.conf /usr/local/etc/nginx/
