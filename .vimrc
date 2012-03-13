" vi互換を無効化
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" bundle
" vim-scripts repos
Bundle 'rails.vim'
Bundle "scrooloose/nerdtree"
Bundle 'vim-ruby/vim-ruby'
Bundle 'Shougo/neocomplcache'

filetype plugin indent on

" plugin setting
" NEARDTree
autocmd vimenter * if !argc() | NERDTree | endif
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.coffee set filetype=coffee
let g:NERDChristmasTree = 1
let g:NERDTreeIgnore=['\.svn']
let g:NERDTreeShowHidden=1
let g:NERDTreeSplitVertical=0

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" key bind
nmap <Space>b :ls<CR>:buffer 
nmap <Space>ls :ls<CR>

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
set clipboard=unnamed,autoselect

" mouse
set mouse=a
set ttymouse=xterm2

" バックスペースでインデントや改行を削除できるようにする
set backspace=2

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

