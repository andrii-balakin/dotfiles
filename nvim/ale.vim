scriptencoding 'utf-8'

let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'

let g:ale_python_pylint_executable = $HOME . '/.pyenv/versions/neovim3/bin/pylint'
let g:ale_python_pylint_use_global = 1
let g:ale_python_flake8_executable = $HOME . '/.pyenv/versions/neovim3/bin/flake8'
let g:ale_python_flake8_use_global = 1
" let g:ale_python_mypy_executable = $HOME . '/.pyenv/versions/neovim3/bin/mypy'
" let g:ale_python_mypy_use_global = 1
let g:ale_python_pyright_executable = $HOME . '/.pyenv/versions/neovim3/bin/pyright-langserver'
let g:ale_python_pyright_use_global = 1

let g:ale_vim_vint_executable = $HOME . '/.pyenv/versions/neovim3/bin/vint'
