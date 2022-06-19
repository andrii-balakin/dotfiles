let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'

" Plugin manager
source ~/.config/nvim/plugins.vim

" Plugin settings
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/tagbar.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/gruvbox.vim
source ~/.config/nvim/deoplete.vim

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
"autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2 smarttab smartindent

set showbreak=└\ 
set list listchars=eol:¬,tab:→\ ,trail:␣,extends:…,precedes:…
set fillchars+=foldopen:▾,foldsep:│,foldclose:▸

set mouse=a

set clipboard+=unnamedplus

set number relativenumber
set numberwidth=4
set foldcolumn=0
set foldmethod=syntax
set foldenable
"set nofoldenable
set signcolumn=auto

"augroup numbertoggle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

func! ClearSyntax()
    let syn=split(execute('syn list'), "\n")[1:]
    call filter(syn, {idx, val -> match(val, '^\w') > -1})
    call map(syn, {idx, val -> split(val)[0]})
    for item in syn
        if match(item, '\c\mcomment') == -1
            try
                exe 'syn clear' item
            " ignore E28 (no such highlight group)
            catch /^Vim\%((\a\+)\)\=:E28/
            endtry
        endif
    endfor
endfu

com! ClearSyntaxExceptComments :call ClearSyntax()

command Reconfigure !cd build && rm -rf * && cmake .. && cd - > /dev/null
command Configure !cd build && cmake .. && cd - > /dev/null
command Rebuild !cd build && make clean && make && cd - > /dev/null
command Build !cd build && make && cd - >/dev/null
command RebuildAndRun !cd build && make clean && make run && cd - > /dev/null
command BuildAndRun !cd build && make run && cd - >/dev/null

map <F5> :Build<CR>
map <F17> :Rebuild<CR>
map <F4> :Configure<CR>
map <F16> :Reconfigure<CR>
map <F6> :BuildAndRun<CR>
map <F18> :RebuildAndRun<CR>

map <F15> :TagbarToggle<CR>

"highlight! OverLength guibg=#472448
"match OverLength /\%80v.\+/

autocmd FileType python noremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
"autocmd FileType python noremap <buffer> <F9> :w<cr> :exec '!python3' shellescape(@%, 1)<cr>
"nnoremap <F9> :w<cr>:!chmod +x %<cr>:!./%<cr>
"set t_Co=256
colorscheme PaperColor
set background=dark
"hi colorcolumn guibg=#472448
"hi cursorline ctermfg=white
"set columns=79
"set wrap
"
set cursorline
"set termguicolors
set guicursor+=a:blinkon1
set colorcolumn=80

"hi! link signcolumn linenr
"hi! link foldcolumn linenr
"hi! link cursorlinenr linenr
"let &colorcolumn=join(range(80,999),",")
"highlight! link TagbarSignature Comment
"highlight! link TagbarPseudoID Comment

let &shell='/bin/zsh --login'

" Toggle 'default' terminal
nmap ,t :call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
nmap ,T :call ChooseTerm("term-pane", 0)<CR>

function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . 'wincmd c'
        else
            :exe 'e #'
    endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe 'topleft split'
        endif
        :exe 'buffer ' . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe 'botright split'
        endif
        :terminal
        :exe 'f ' a:termname
        :set nonumber
        :set norelativenumber
        :set foldcolumn=0
        :startinsert
    endif
endfunction

