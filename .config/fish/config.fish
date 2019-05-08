# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# direnv
eval (direnv hook fish)

# ghq
set -x GHQ_ROOT $HOME/repository

# powershell
function fish_prompt
    powerline-shell --shell bare $status
end

# development
set -x PATH ./bin $PATH

# alias
alias ls='ls -G'
alias ll='ls -la'
alias vi='/usr/bin/vim'
alias be='bundle exec'
alias diff='colordiff --side-by-side --suppress-common-lines'
alias less='less -R'

