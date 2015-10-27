alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias tree="tree -C"
alias curlhead="curl -IL"
alias http-server="python3 -m http.server"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias rmpyc="find . -name '*.pyc' -delete"

# Docker machines env vars
alias docker-default-env='eval "$(docker-machine env default)"'
