# link to dotfiles

```
mkdir -p repository/github.com/ppworks
cd repository/github.com/ppworks
git clone git@github.com:ppworks/dotfiles.git
```

```
cd ~
ln -nsf ~/repository/github.com/ppworks/dotfiles/.gitconfig .gitconfig
ln -nsf ~/repository/github.com/ppworks/dotfiles/.zshrc .zshrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vim .vim
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vimrc .vimrc
```

# clone vundle

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

# BundleInstall

```
:BundleInstall
```

