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

ln -s .zshrc.$(uname -s) .zshrc
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

Whenever you want to to work with your dotfiles git repository, just set the `GIT_DIR` and `GIT_WORK_TREE` evironment variables with the following command:

```
dotfiles
```

`dotfiles` is an alias of `eval $(dotfiles-env)`. You can change the location of your dotfiles git repository by overriding the `dotfiles-env` function. The default variables are:

```
export GIT_DIR=~/.dotfiles.git
export GIT_WORK_TREE=~/
```

