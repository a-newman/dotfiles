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

Install gnome-tweak-tools: 

`sudo apt-get install gnome-tweaks`

Open with `gnome-tweaks.` Go to Keyboard and Mouse -> Additional Layout Options -> Ctrl position -> Swap Ctrl and Caps Lock.

### Installing node and npm 

Follow [these instructions](https://github.com/nodesource/distributions/#deb)

### Ubuntu, putting launcher dock at bottom of screen 

See [here](https://www.howtogeek.com/349697/how-to-move-ubuntu%E2%80%99s-launcher-bar-to-the-bottom-or-right/)

### Set VLC as default video player 

`sudo snap install vlc`

Search "default applications" and under video set "VLC" as default

### TODO remote desktop 
https://www.tecmint.com/nomachine-an-advanced-remote-desktop-access-tool/
