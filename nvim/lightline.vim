let g:lightline = { 'colorscheme': 'PaperColor', }

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
