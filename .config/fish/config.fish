# homebrew
fish_add_path /opt/homebrew/bin

# pg
fish_add_path /opt/homebrew/opt/libpq/bin

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# bundler
set -x BUNDLE_JOBS 32
set -x BUNDLE_RETRY 3


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
set -x PATH $HOME/bin:$PATH
set -x PATH ./bin:$PATH

# alias
alias ls='ls -G'
alias ll='ls -la'
alias vi='/usr/bin/vim'
alias be='bundle exec'
alias diff='git diff --no-index '
alias less='less -R'
alias rbcp='git diff master --name-only --diff-filter=ACMR|grep -e .rb\$ -e .rake\$|xargs bundle exec rubocop -a --force-exclusion -c ./.rubocop.yml'

source /Users/koshikawa/.docker/init-fish.sh || true # Added by Docker Desktop

# https://github.com/rails/rails/issues/38560
# +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY yes

# Claude Code
set -x PATH $HOME/.local/bin $PATH
