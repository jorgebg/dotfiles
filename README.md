# jorgebg dotfiles :rocket:

## Install

```
export GIT_DIR=~/.dotfiles.git
export GIT_WORK_TREE=~/
cd ~/
git init
git remote add origin git@github.com:jorgebg/dotfiles.git
git pull --rebase origin master
```

## Working with the git tree

```
eval $(dotfiles) # Exports the GIT_DIR and GIT_WORK_TREE variables
```
