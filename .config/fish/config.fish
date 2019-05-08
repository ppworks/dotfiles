# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# direnv
eval (direnv hook fish)

# powershell
function fish_prompt
    powerline-shell --shell bare $status
end
