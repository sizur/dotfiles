# -*- shell-script -*-
# oh-my-zsh custom config file
ZSH_THEME="bullet-train"
BULLETTRAIN_STATUS_SHOW=true
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_VIRTUALENV_SHOW=false
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_NVM_SHOW=false
BULLETTRAIN_GO_SHOW=false
# export BULLETTRAIN_DIR_CONTEXT_SHOW=true
BULLETTRAIN_DIR_EXTENDED=2
BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_IS_SSH_CLIENT=true
# export BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_TIME_12HR=false
REPORTTIME=2
BULLETTRAIN_GIT_SHOW=false

export EDITOR='emacsclient -c'
alias e='emacsclient -c'

path[1,0]=~/bin
path[1,0]=~/.emacs.d/local/bin

# OPAM configuration
. /home/sizur/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
