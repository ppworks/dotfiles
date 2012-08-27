" vi互換を無効化
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" bundle
" vim-scripts repos

Bundle 'vundle'
Bundle 'tpope/vim-rails'
Bundle "scrooloose/nerdtree"
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'basyura/unite-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'

filetype plugin indent on

" plugin setting
" rails
let g:rails_level=4
au FileType ruby  :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType eruby :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType coffee :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType scss :set nowrap tabstop=2 tw=0 sw=2 expandtab

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

" unite.vim
" バッファ一覧
nnoremap <silent> <space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <space>ll :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> <space>ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <space>um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <space>uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" oで開く
au FileType unite noremap <silent> <buffer> <expr> o unite#do_action('open')
au FileType unite inoremap <silent> <buffer> <expr> o unite#do_action('open')


""""""
" syntaxを有効化
syntax on

" カラースキーマを設定
set t_Co=256
colorscheme candycode

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

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
set list
set listchars=tab:^_
