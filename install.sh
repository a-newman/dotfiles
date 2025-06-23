# !/bin/bash

# This is for installing setup on MAC machines

set -e 

echo "Installing Prezto" 

rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
/bin/zsh -c 'setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done'

# Copy files into home dir 
echo "Copying dotfiles into home dir" 
cp dotfiles/.bash_aliases ~ 
cp dotfiles/.bash_profile ~ 
cp dotfiles/.bashrc ~ 
cp dotfiles/.tmux.conf ~ 
cp dotfiles/.vimrc ~ 
cp dotfiles/.zpreztorc ~ 
cp dotfiles/.zshrc ~ 
cp dotfiles/.firstcell.py ~ 

# Install Vundle 
echo "Installing Vundle and Plugins" 
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -E +PluginInstall +qall 

# Install tmux 
brew install tmux

# Install stuff needed for agnoster theme 

# Install fonts. Run this and then finish the iTerm2 setup described here
# https://gist.github.com/alexpaul/4c1d2e34cec3d6d8181f47fa909ca5a8
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Copy over agnoster file
cp dotfiles/agnoster.zsh-theme ~/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme
