export LANG=ja_JP.UTF-8

# homebrewを優先
export PATH=/usr/local/bin:$PATH

# homedirectoryを優先
export PATH=$HOME/bin:$HOME/local/bin:$PATH

# editor
export EDITOR=vim

# beep音を消す
setopt nolistbeep
setopt no_beep

# 補完機能
autoload -U compinit
compinit -u

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

# alias
alias ls="ls -G"
alias ll='ls -la'
alias vi='/usr/bin/vim'
alias editor='vim'
alias be='bundle exec'
alias diff='colordiff --side-by-side --suppress-common-lines'
alias less='less -R'
alias ag='ag -S'
alias chrome-headless='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --headless --remote-debugging-port=9222 --disable-gpu --crash-dumps-dir=/tmp'
if whence ack > /dev/null; then
    alias a="ack -a --ignore-dir=log --ignore-dir=tmp --ignore-dir=.bundle --pager=less"
fi
if whence pg_ctl > /dev/null; then
    alias pg.start="pg_ctl -D /usr/local/var/postgres -l logfile start"
    alias pg.stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
fi

alias ehead='grunt server --gruntfile /Users/koshikawa/repository/github.com/mobz/elasticsearch-head/Gruntfile.js'

# http://qiita.com/takc923/items/45386905f70fde9af0e7
alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"

alias d="docker"
alias d-c="docker-compose"

alias clean-rails-logs="rm log/*.log"

# face
local user_host="%{$fg[yellow]%}%n%{$fg_bold[red]%}@%{$reset_color%}%{$fg[green]%}%m${blue_cp}"
local smiley="%(?,%{$fg_bold[blue]%}|＾_＾|%{$reset_color%},%{$fg_bold[red]%}|＋_＋|%{$reset_color%})"

PROMPT='${user_host}%{$fg_bold[red]%} ➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%} [%D{%F %T}]
${smiley} '
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# phpenv
if [ -d ${HOME}/.phpenv/bin ]; then
    export PHPENV_ROOT="$HOME/.phpenv"
    export PATH="$PHPENV_ROOT/bin:$PATH"
    eval "$(phpenv init -)"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="vendor/bin:$PATH"
eval "$(rbenv init -)"

# npm
if [ -d ${HOME}/node_modules/.bin ]; then
    export PATH=${PATH}:${HOME}/node_modules/.bin
fi

# yarn
export PATH="$PATH:`yarn global bin`"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# zsh: no matches found を防ぐ
setopt nonomatch

ulimit -n 1024
eval "$(direnv hook zsh)"

# go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# ghq
export GHQ_ROOT="$HOME/repository"

# docker-machine
#eval $(docker-machine env dev)

# bundler
export BUNDLE_PATH=./vendor/bundle
export BUNDLE_WITHOUT=production:staging
export BUNDLE_BIN=./vendor/bin
export BUNDLE_GEM__COC=false
export BUNDLE_GEM__MIT=false
export BUNDLE_GEM__TEST=rspec
export BUNDLE_BUILD__NOKOGIRI="--use-system-libraries=true --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2"
export BUNDLE_BUILD__EVENTMACHINE="--with-cppflags=-I/usr/local/opt/openssl/include"
export BUNDLE_BUILD__LIBV8=--with-system-v8
export BUNDLE_JOBS=32 #`expr $(sysctl -n hw.ncpu) - 1`
export BUNDLE_RETRY=3

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"
