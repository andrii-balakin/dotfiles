# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# prompt setup
PROMPT='%B%(?.%F{blue}.%F{red})▶%b%f %1~ %# '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_%*'
zstyle ':vcs_info:git:*' formats '%F{blue}(%b)%r%f '
zstyle ':vcs_info:*' enable git

# iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# aliases
alias v="nvim"
alias vd="nvim -d"

# pyenv initialization
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib/:$LD_LIBRARY_PATH"

