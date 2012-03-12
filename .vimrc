" vi互換を無効化
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" bundle
" vim-scripts repos
Bundle 'rails.vim'
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle 'vim-ruby/vim-ruby'
Bundle 'Shougo/neocomplcache'

filetype plugin indent on

" plugin setting
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * NERDTree ./
endif
let NERDTreeSplitVertical=0

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
set clipboard=unnamed,autoselect



