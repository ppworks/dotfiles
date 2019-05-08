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
ln -nsf ~/repository/github.com/ppworks/dotfiles/.hyper.js .hyper.js
ln -nsf ~/repository/github.com/ppworks/dotfiles/.rspec .rspec
ln -nsf ~/repository/github.com/ppworks/dotfiles/.tigrc .tigrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vim .vim
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vimrc .vimrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/bin bin
```

# Neobundle

```
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
