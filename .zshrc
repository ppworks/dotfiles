export LANG=ja_JP.UTF-8 

# homebrewを優先
export PATH=/usr/local/bin:$PATH

# homedirectoryを優先
export PATH=$HOME/bin:$PATH

# editor
export EDITOR=vim

# beep音を消す
setopt nolistbeep
setopt no_beep

# 補完機能
autoload -U compinit
compinit

# ls color
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'


zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# 補完候補を詰めて表示
setopt list_packed

# 入力したコマンドを修正
setopt correct 

# ファイル権限マスク
umask 002

#set PROMPT
setopt prompt_subst
autoload -U colors
colors

local BG_RED=$'%{\e[30;41m%}';
local BG_GREEN=$'%{\e[30;42m%}';
local BG_YELLOW=$'%{\e[30;43m%}';
local BG_BLUE=$'%{\e[30;44m%}';
local GREEN=$'%{\e[32;49m%}';

if [[ -z "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
    #local shell
    PROMPT="%U%{${BG_YELLOW}%}[%n@%m]%{${reset_color}%}%u(%j) %~
%# "
else
    #remote shell
    PROMPT="%U%{${BG_RED}%}[%n@%m]%{${reset_color}%}%u(%j) %~
%# "
fi

# vim key bind
bindkey -v

# for less
export LESS="-R"

# auto cd
setopt auto_cd
setopt auto_pushd
setopt auto_remove_slash
setopt pushd_ignore_dups 

# sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F${GREEN}%1v%f|)"

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_no_store
function history-all { history -E 1 } 
setopt hist_ignore_dups
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# sbinにもpath通す
export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:$PATH

# perlbrew
if [ -s $HOME/perl5/perlbrew ]; then
    export PATH="$PATH:$HOME/perl5/perlbrew"
    source $HOME/perl5/perlbrew/etc/bashrc
fi


# mac
if [ `uname` = "Darwin" ]; then
    # dns
    alias dnsclear='dscacheutil -flushcache'
fi

# rvm
if [ -s $HOME/.rvm/bin ]; then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# alias
alias ls="ls -G"
alias ll='ls -la'
alias vi='/usr/bin/vim'
alias editor='vim'
if whence ack > /dev/null; then
    alias a="ack -a --ignore-dir=log --ignore-dir=tmp --ignore-dir=.bundle --pager=less"
fi
