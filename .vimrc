set nocompatible
filetype plugin indent on
syntax enable

" 見た目
set number
set ruler
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set t_Co=256
set background=dark

" タブ・インデント
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" 検索
set hlsearch
set incsearch
set ignorecase
set smartcase

" 編集
set backspace=2
set showmatch
set wildmenu
set hidden
set clipboard+=unnamed
set mouse=a

" 不可視文字の表示
set list
set listchars=tab:^_

" swap/backup
set directory=~/.vim/tmp
set backupdir=~/.vim/backup

" 改行をLF
set fileformat=unix

" キーマップ
inoremap jj <Esc>
vnoremap <silent> <C-p> "0p<CR>
