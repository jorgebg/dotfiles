function activate () {
    . `find . -name activate | head -n 1`
}

function dotfiles-env {
    # Usage: eval \$(dotfiles)
    cat << EOF
export GIT_DIR=~/.dotfiles.git
export GIT_WORK_TREE=~/
EOF
}

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

function clean-desktop {
    TARGET=~/Desktop/Stack/$(date "+%Y-%m-%d")/
    mkdir -p $TARGET
    mv ~/Desktop/^Stack $TARGET
}

function whiletrue {
    while true; do $@; done;
}

function devip_qr {
    if [ "$1" != "" ]
    then
        port=$1
    else
        port=8000
    fi
    devip | awk '{print $1":'$port'"}' | tee /dev/tty | qr
}

function gitignore {
    if [ "$#" -ne 1 ]
    then
      echo "Usage: gitignore <TEMPLATE>\nExample: gitignore Python"
      return 1
    fi
  wget https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore -O .gitignore
}

# function gitpersonal {
#   cat << EOF
#     export GIT_AUTHOR_NAME='Jorge Barata'
#     export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
#     export GIT_AUTHOR_EMAIL='jorge.barata.gonzalez@gmail.com'
#     export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
#     export GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa_personal'
# EOF
# }

# OS X

function vpn-connect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "$1"
                if exists VPN then connect VPN
                repeat while (current configuration of VPN is not connected)
                    delay 1
                end repeat
        end tell
end tell
EOF
}

function vpn-disconnect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "$1"
                if exists VPN then disconnect VPN
        end tell
end tell
return
EOF
}

# function host-manager {
#     # https://gist.github.com/nddrylliog/1368532
#     path="/etc/hosts"
#     addusage="Usage: `basename $0` -add host address"
#     remusage="Usage: `basename $0` -remove host"
#     case "$1" in
#     -add)
#       if [ $# -eq 3 ]; then
#         if [[ -n $(grep "^$3.*[^A-Za-z0-9\.]$2$" ${path}) ]]; then
#           echo "Duplicate address/host combination, ${path} unchanged."
#         else
#           printf "$3\t$2\n" >> ${path}
#         fi
#       else
#         echo $addusage;
#       fi
#       ;;
#     -remove)
#       if [ $# -eq 2 ]; then
#         sed -i '' -e "s/^[^#].*[^A-Za-z0-9\.]$2$//g" -e "/^$/ d" ${path}
#       else
#         echo $remusage;
#       fi
#       ;;
#     *)
#       echo $addusage;
#       echo $remusage;
#     esac
# }
