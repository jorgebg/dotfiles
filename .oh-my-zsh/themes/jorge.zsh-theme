# jorge.zsh-theme

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "%{$FG[214]%}±" && return
  echo "%{$FG[132]%}»"
}

function box_name {
    if [[ -n $SSH_CONNECTION ]]; then
      echo -n "%{$FG[170]%}"
    fi
    hostname
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'
local virtualenv_info='$(virtualenv_info)'
local box_name='$(box_name)'

export VIRTUAL_ENV_DISABLE_PROMPT=true


PROMPT="%{$fg[cyan]%}%n%{$FG[126]%}@%{$fg[blue]%}${box_name} %{$FG[214]%}${current_dir}%{$reset_color%} ${git_info}
%{$FG[239]%}%* %{$FG[078]%}${virtualenv_info}%{$reset_color%}${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[239]%}(%{$FG[126]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[239]%}) %{$fg[yellow]%}✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[239]%}) %{$fg[green]%}✔%{$reset_color%}"
