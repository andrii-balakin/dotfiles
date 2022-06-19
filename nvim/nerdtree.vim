let mapleader = ","
map ,n :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

"Open a NERDTree automatically when vim starts up?
"autocmd VimEnter * NERDTree

"Open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && !exists("s:std_in") | wincmd p | if isdirectory(argv()[0]) | ene | wincmd p | endif | endif

"Close vim if the only window left open is a NERDTree?
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen=3
