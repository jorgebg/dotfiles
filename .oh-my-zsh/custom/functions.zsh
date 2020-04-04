function activate () {
    # Search recursively for a python environment in the current path (created with venv or virtualenv) and activate it
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
    if ! [ -x "$(command -v devip)" ]; then
        echo 'Error: devip is not installed.' >&2
        echo 'Please run:\n  pip3 install dev-ip'
        return 1
    fi
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


# OS X

function osx-vpn-connect {
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

function osx-vpn-disconnect {
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
