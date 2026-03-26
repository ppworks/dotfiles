" vi互換モードOFF、Vimの全機能を使う
set nocompatible
" ファイルタイプに応じたプラグイン・インデントを有効化
filetype plugin indent on
" シンタックスハイライト有効化
syntax enable

" 見た目
set number                  " 行番号を表示
set ruler                   " 右下にカーソル位置(行,列)を表示
set laststatus=2            " ステータスラインを常に表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P  " ファイル名・文字コード・改行コード・カーソル位置
set t_Co=256                " ターミナルで256色を使う
set background=dark         " 暗い背景に合わせた配色

" タブ・インデント
set tabstop=4               " タブ文字の表示幅
set shiftwidth=4            " >>等のインデント幅
set softtabstop=4           " Tabキー押下時に挿入するスペース数
set expandtab               " タブをスペースに変換
set smarttab                " 行頭のTabでshiftwidth分インデント

" 検索
set hlsearch                " 検索マッチを全部ハイライト
set incsearch               " 入力中にリアルタイム検索
set ignorecase              " 検索で大文字小文字を無視
set smartcase               " 大文字を含むときだけ大文字小文字を区別

" 編集
set backspace=2             " BSでインデント・改行・挿入開始点を削除可能に
set showmatch               " 括弧入力時に対応する括弧を一瞬ハイライト
set wildmenu                " コマンド補完を強化(候補をバーに表示)
set hidden                  " ファイル未保存でも別バッファに切り替え可能
set clipboard+=unnamed      " ヤンクがシステムクリップボードと連携
set mouse=a                 " マウスでカーソル移動・選択ができる

" 不可視文字の表示
set list                    " 不可視文字を表示する
set listchars=tab:^_        " タブ文字を ^_ で表示

" swap/backup の保存先
set directory=~/.vim/tmp    " swapファイル
set backupdir=~/.vim/backup " バックアップファイル

" 改行コードをLFに統一
set fileformat=unix

" キーマップ
inoremap jj <Esc>                    " jj で挿入モードを抜ける
vnoremap <silent> <C-p> "0p<CR>      " 選択置換後も元のヤンク内容でペーストし続ける
