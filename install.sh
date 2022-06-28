#!/bin/zsh

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# pyenv
curl https://pyenv.run | bash

# zsh
ln -s ~/dotfiles/zshrc  ~/.zshrc
source ~/.zshrc

# tmux
brew install tmux
ln -s ~/dotfiles/tmux.conf  ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux source ~/.tmux.conf

# neovim
pyenv install --skip-existing 2.7.18
pyenv virtualenv 2.7.18 neovim2\
    && pyenv activate neovim2\
    && pip install neovim\
    && pyenv deactivate

pyenv install --skip-existing 3.10.1
pyenv virtualenv 3.10.1 neovim3\
    && pyenv activate neovim3\
    && pip install neovim\
    && pyenv deactivate

brew install nvim
mkdir ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim
mkdir -p ~/local/share
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh |sh -s ~/.local/share/dein
nvim --headless +qa

# iterm2
brew install iterm2
rmdir /Users/andriibalakin/Library/Application\ Support/iTerm2/Scripts                                                                                                                   (master)dotfiles 15:56:27
ln -s ~/dotfiles/iterm2/Scripts /Users/andriibalakin/Library/Application\ Support/iTerm2/Scripts
