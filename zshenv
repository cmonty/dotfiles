autoload -U compinit
compinit
autoload -U colors
colors

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

setopt no_auto_menu
setopt prompt_subst
set -o emacs

export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/.rvm/bin:/usr/local/Cellar/smlnj/110.75/libexec/bin:$PATH
export JAVA_HOME=/Library/Java/Home
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR='vim'
export GREP_OPTIONS='--color=auto'
export NODE_PATH=/usr/local/lib/node:$NODE_PATH
export GOPATH=~/.go

alias rc='rake_commit'
alias ll='ls -la'
alias ss='./script/server'
alias sc='./script/console'

git_prompt_info() {
  ref=$($(which git) symbolic-ref HEAD 2> /dev/null) || return
  user=$($(which git) config user.name 2> /dev/null)
  echo " (${user}@${ref#refs/heads/})"
}

export PROMPT='%{$fg_bold[green]%}%n@%m:%{$fg_bold[blue]%}%~%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}%(!.#.$) '

if [ -f ~/code/personal/ec2/env ]; then
  source ~/code/personal/ec2/env
fi

if [ -f ~/bt/system-scripts/pairing_stations/ec2env ]; then
  export SYSTEM_SCRIPTS=~/bt/system-scripts
  source ~/bt/system-scripts/pairing_stations/ec2env
fi

if [ -f ~/bt/system-scripts/pairing_stations/aliases ]; then
  source ~/bt/system-scripts/pairing_stations/aliases
fi

source ~/.zshenv_personal
# [[ -s "/Users/cory/.rvm/scripts/rvm" ]] && source "/Users/cory/.rvm/scripts/rvm"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
