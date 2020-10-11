alias curlhead="curl -IL"
alias dns-restart="sudo killall -HUP mDNSResponder"
alias dotfiles='eval "$(dotfiles-env)"'
alias git-search-first-commit='git log --source --all -S'
alias http-server="python3 -m http.server"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias loadenv='export $(cat .env | xargs)'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias rmpyc="find . -name '*.pyc' -delete"
alias sshconfig='cat ~/.ssh/config'
alias tree="tree -C"
alias zshrc="$EDITOR ~/.zshrc"
alias youtube-dl-album="youtube-dl -o '%(playlist_index)02d - %(title)s.%(ext)s' --extract-audio --audio-format opus --audio-quality 0 --add-metadata"

if ! command -v pbcopy; then alias pbcopy='xclip -selection clipboard'; fi
if ! command -v pbpaste; then alias pbpaste='xclip -selection clipboard -o'; fi

if ! command -v open; then alias open="xdg-open"; fi