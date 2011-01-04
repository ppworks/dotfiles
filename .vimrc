" vi互換を無効化
set nocompatible

" syntaxを有効化
syntax on

" カラースキーマを設定
set t_Co=256
colorscheme candycode

" カーソル行をハイライト
set cursorline

" 行番号の表示
set number
set ruler
hi LineNr ctermfg=darkgrey ctermbg=black

" status lineの表示
set laststatus=2

" status lineへ文字コード 改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" nowrap
"set nowrap

" ファイル形式の検出を有効化
filetype on

" ftpluginsを有効にする
" .vim/ftplugin/hoge.vim でファイルタイプがhogeの場合のみロードされるようにする
filetype plugin on

filetype indent on

" tab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" search 時の強調
set hls

" search 時の大文字小文字無視
set is

" .swapファイルの保存先
set directory=~/.vim/tmp

" backupファイルの保存先
set backupdir=~/.vim/backup

" clipboard
set clipboard=unnamed
