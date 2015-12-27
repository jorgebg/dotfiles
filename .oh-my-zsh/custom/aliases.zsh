alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias tree="tree -C"
alias curlhead="curl -IL"
alias http-server="python3 -m http.server"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias rmpyc="find . -name '*.pyc' -delete"
alias loadenvs='export $(cat .env | xargs)'
alias dokku='~/.dokku/contrib/dokku_client.sh'
alias sshconfig='cat ~/.ssh/config'
alias dotfiles-env='eval "$(dotfiles-vars)"'


function dotfiles-vars {
cat << EOF
export GIT_DIR=~/.dotfiles.git
export GIT_WORK_TREE=~/
EOF
}

# Docker machines env vars
alias docker-default-env='eval "$(docker-machine env default)"'

function wsclone {
    if [ "$#" -ne 1 ]
    then
      echo "Usage: wsclone <USER/PROJECT>"
      return 1
    fi

    cd ~/Workspace
    take $1
    hub clone $1 .
}
