# homebrew
fish_add_path /opt/homebrew/bin

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# bundler
set -x BUNDLE_JOBS 32
set -x BUNDLE_RETRY 3

# goenv
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin:$PATH
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin:$PATH
status --is-interactive; and source (goenv init -|psub)

# nodenv
fish_add_path $HOME/.nodenv/bin
eval (nodenv init - | source)

# pyenv
status is-login; and pyenv init --path | source

# npm
set -x PATH node_modules/.bin/:$PATH

# direnv
eval (direnv hook fish)

# ghq
set -x GHQ_ROOT $HOME/repository

# powershell
function fish_prompt
    powerline-shell --shell bare $status
end

# development
fish_add_path $HOME/bin
fish_add_path ./bin

# alias
alias ls='ls -G'
alias ll='ls -la'
alias vi='/usr/bin/vim'
alias be='bundle exec'
alias diff='colordiff --side-by-side --suppress-common-lines'
alias less='less -R'
