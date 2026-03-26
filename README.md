# link to dotfiles

```
mkdir -p repository/github.com/ppworks
cd repository/github.com/ppworks
git clone git@github.com:ppworks/dotfiles.git
```

```
cd ~
ln -nsf ~/repository/github.com/ppworks/dotfiles/.config/fish .config/fish
ln -nsf ~/repository/github.com/ppworks/dotfiles/.config/powerline-shell .config/powerline-shell
ln -nsf ~/repository/github.com/ppworks/dotfiles/.gitconfig .gitconfig
ln -nsf ~/repository/github.com/ppworks/dotfiles/.gemrc .gemrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/.rspec .rspec
ln -nsf ~/repository/github.com/ppworks/dotfiles/.tigrc .tigrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vimrc .vimrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/bin bin
ln -nsf ~/repository/github.com/ppworks/dotfiles/.nodenv/default-packages .nodenv/default-packages
mkdir -p ~/.vim/tmp ~/.vim/backup
```
