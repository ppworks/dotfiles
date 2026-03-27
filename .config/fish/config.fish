# === PATH ===
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/libpq/bin
fish_add_path $HOME/.rbenv/bin
fish_add_path $HOME/.nodenv/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
contains ./bin $PATH; or set -gx PATH ./bin $PATH
contains node_modules/.bin $PATH; or set -gx PATH node_modules/.bin $PATH

# === ランタイム初期化 ===
status --is-interactive; and source (rbenv init -|psub)
eval (nodenv init - | source)
status is-login; and pyenv init --path | source

# === 環境変数 ===
set -x BUNDLE_JOBS 32
set -x BUNDLE_RETRY 3
set -x GHQ_ROOT $HOME/repository
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY yes

# === direnv ===
eval (direnv hook fish)

# === プロンプト ===
function fish_prompt
    powerline-shell --shell bare $status
end

# === エイリアス ===
alias ls='ls -G'
alias ll='ls -la'
alias vi='/usr/bin/vim'
alias be='bundle exec'
alias diff='git diff --no-index '
alias less='less -R'
alias rbcp='git diff master --name-only --diff-filter=ACMR|grep -e .rb\$ -e .rake\$|xargs bundle exec rubocop -a --force-exclusion -c ./.rubocop.yml'
