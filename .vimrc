" vi互換を無効化
set nocompatible

filetype off

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'vundle'
NeoBundle 'tpope/vim-rails'
NeoBundle "scrooloose/nerdtree"
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'basyura/unite-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kana/vim-altr'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'taka84u9/unite-git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'kana/vim-fakeclip.git'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" plugin setting
" rails
let g:rails_level=4
au FileType ruby  :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType eruby :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType coffee :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType scss :set nowrap tabstop=2 tw=0 sw=2 expandtab

" NEARDTree
"autocmd vimenter * if !argc() | NERDTree | endif
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.es6 set filetype=javascript
let g:NERDChristmasTree = 1
let g:NERDTreeIgnore=['\.svn']
let g:NERDTreeShowHidden=1
let g:NERDTreeSplitVertical=0
noremap <silent> <C-t> :<C-u>:NERDTreeToggle<CR>

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
"let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> <space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <space>ll :<C-u>Unite buffer git_modified file_mru -buffer-name=files<CR>
nnoremap <silent> <space>mm :<C-u>Unite outline<CR>
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
"au FileType unite noremap <silent> <buffer> <expr> o unite#do_action('open')
"au FileType unite inoremap <silent> <buffer> <expr> o unite#do_action('open')

let g:unite_source_actions = {
            \ "Unite outline <space>mm" : "Unite outline",
            \ }
nnoremap <silent> <space>la :<C-u>Unite actions<CR>

" unite-ag

"" unite-grep {{{
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup -U'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" unite-grepのキーマップ
nnoremap <space>g :<C-u>Unite grep:./<CR>
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep:::<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }}}


""""""
" syntaxを有効化
syntax enable
" カラースキーマを設定
set t_Co=256
set background=dark
colorscheme solarized

" 行番号の表示
set number
set ruler
hi LineNr ctermfg=lightgray ctermbg=none

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
set clipboard+=unnamed

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

" vimの連続コピペできない問題
" http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p<CR>

inoremap jj <Esc>

" altr-back
nmap <C-]> <Plug>(altr-back)
call altr#define('%.rb', 'spec/%_spec.rb')
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb')
call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
call altr#define('app/authorizers/%.rb', 'spec/authorizers/%_spec.rb')
call altr#define('app/mailers/%.rb', 'spec/mailers/%_spec.rb')

nnoremap <silent> <space>d :<C-u>Gdiff<CR>

" 行末の半角スペースを削除
"autocmd BufWritePre * :%s/\s\+$//e
" 改行をLF
set fileformat=unix
