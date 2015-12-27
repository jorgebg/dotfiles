function activate () {
    . `find . -name activate | head -n 1`
}

function dotfiles-vars {
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
