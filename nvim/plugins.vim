"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/andriibalakin/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/andriibalakin/.local/share/dein')
    call dein#begin('/Users/andriibalakin/.local/share/dein')

    " Let dein manage dein
    call dein#add('/Users/andriibalakin/.local/share/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    " Themes
    call dein#add('cocopon/iceberg.vim')
    call dein#add('dracula/vim')
    call dein#add('morhetz/gruvbox')
    call dein#add('sonph/onehalf', { 'rtp': 'vim' })
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('f-person/auto-dark-mode.nvim')

    " Basic
    call dein#add('itchyny/lightline.vim')
    call dein#add('majutsushi/tagbar')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Shougo/deoppet.nvim')

    " Basic language suppport
    " call dein#add('lervag/vimtex')
    call dein#add('rust-lang/rust.vim')

    " Autocomplete
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('deoplete-plugins/deoplete-jedi')
    call dein#add('deoplete-plugins/deoplete-clang')

    " Linting
    call dein#add('dense-analysis/ale')

    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    call dein#end()
    call dein#save_state()
endif

filetype indent plugin on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

" Remove disabled plugins
" call map(dein#check_clean(), delete(v:val, 'rf'))

"End dein Scripts-------------------------

