# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# bundler
set -x BUNDLE_WITHOUT production:staging
set -x BUNDLE_GEM__COC false
set -x BUNDLE_GEM__MIT false
set -x BUNDLE_GEM__TEST rspec
set -x BUNDLE_BUILD__NOKOGIRI "--use-system-libraries=true --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/usr/include/libxml2"
set -x BUNDLE_BUILD__EVENTMACHINE "--with-cppflags=-I/usr/local/opt/openssl/include"
set -x BUNDLE_BUILD__LIBV8 --with-system-v8
set -x BUNDLE_JOBS 32
set -x BUNDLE_RETRY 3
set -x LDFLAGS "-L/usr/local/opt/libffi/lib"
set -x PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"

# goenv
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin:$PATH
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin:$PATH
status --is-interactive; and source (goenv init -|psub)

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin:$PATH

# pyenv
status --is-interactive; and source (pyenv init -|psub)

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
alias diff='colordiff --side-by-side --suppress-common-lines'
alias less='less -R'

