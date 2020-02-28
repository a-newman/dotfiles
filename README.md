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

### See your conda env on the command line

Edit the agnoster theme to show the conda env instead of virtualenv: 
https://github.com/agnoster/agnoster-zsh-theme/pull/109/files#diff-4c8be88e7aebd4b991bb908fd51e2815
Modify this file: 
/home/anelise/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme

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

### Making a conda environment jupyter accessible 
`conda install nb_conda`

### Ale
if you make a new conda environment, you must run `pip install yapf` to enable Python fixing

### DuckDuckGo

- Install in FireFox (becomes default search engine automatically): https://duckduckgo.com/install

### Custom shortcut to put computer to sleep 

Follow instructions at this link: 
https://samtinkers.wordpress.com/2013/07/03/keyboard-shortcut-for-suspendsleep-laptop/

Basically: 

```
echo "systemctl suspend; exit 0" > compsleep
chmod +x compsleep
sudo mv compsleep /bin/
```

Now you have a command `compsleep` that does what it says on the tin. Then go into Ubuntu settings and add a new keyboard shortcut for the command `compsleep`. 

**EDIT**: turns out that Super + L does this automatically, no need for extra setup.
