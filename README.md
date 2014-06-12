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
ln -nsf ~/repository/github.com/ppworks/dotfiles/.gemrc .gemrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vim .vim
ln -nsf ~/repository/github.com/ppworks/dotfiles/.vimrc .vimrc
ln -nsf ~/repository/github.com/ppworks/dotfiles/.tmux.conf .tmux.conf
ln -nsf ~/repository/github.com/ppworks/dotfiles/.bundle .bundle
ln -nsf ~/repository/github.com/ppworks/dotfiles/.rspec .rspec
```

# Neobundle

```
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
