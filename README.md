# jorgebg dotfiles :rocket:

## Requirements

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

## Install

```
export GIT_DIR=~/.dotfiles.git
export GIT_WORK_TREE=~/
cd ~/
git init
git remote add origin git@github.com:jorgebg/dotfiles.git
git pull --rebase origin master

ln -S .zshrz.$(uname -s) .zshrc
```

### Bootstrap

```
cd .oh-my-zsh/custom/bootstrap/

# Debian
sudo apt-get install -y $(cat apt.txt)

# Python
pip3 install -r requirements.txt

# OSX
brew bundle
```


## Working with the git tree

```
eval $(dotfiles) # Exports the GIT_DIR and GIT_WORK_TREE variables
```
