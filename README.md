# Dotfiles 

## Setup steps 

### Install [Vundle](https://github.com/VundleVim/Vundle.vim)

Basically run the following line and then run `:PluginInstall` inside Vim.

```
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install [YCM](https://github.com/ycm-core/YouCompleteMe)

First install related tools: 

```
sudo apt install build-essential cmake python3-dev
```

Then compile it (options below are w/o support for C-family languages, w/ 
support for JS/TS.

```
cd ~/.vim/bundle/youcompleteme
python3 install.py --ts-completer
```

### Install Prezto
TODO

## Handy tips

### Changing default conda env

Change the line in .zshrc to read `conda activate myenv`. 

### Swapping Ctrl and Caps Lock

Install `gnome-tweak-tools.` Open with `gnome-tweaks.` Go to Keyboard and Mouse -> Additional Layout Options -> Ctrl position -> Swap Ctrl and Caps Lock.

